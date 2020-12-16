import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/network/network.dart';
import 'package:zmusic_flutter/utils/tools.dart';

class API {
  static Home home = Home();
  static Login login = Login();
  static User user = User();
  static Song song = Song();
  static CommentAPI comment = CommentAPI();
}

class Song {
  ///歌曲详情
  String songDetail = "/song/detail?timestamp=";

  ///检查歌曲是否可以播放
  String checkMusic = "/check/music";

  ///获取歌曲播放地址
  String songUrl = "/song/url";

  ///获取歌词
  String lyrics = "/lyric";

  Future<Map> checkMusicRequest(String songId) async {
    return await HttpManager.getInstance()
        .post(checkMusic, params: {"id": songId});
  }

  Future<Map> getSongUrlRequest(String songId) async {
    return await HttpManager.getInstance().post(
        songUrl + "?timestamp=${DateTime.now().millisecondsSinceEpoch}",
        params: {"id": songId});
  }

  Future<Map> getSongDetailRequest(String songIds) async {
    return await HttpManager.getInstance().post(
        songDetail + "?timestamp=${DateTime.now().millisecondsSinceEpoch}",
        params: {"ids": songIds});
  }

  Future<Map> getSongLyricsRequest(String songId) async {
    return await HttpManager.getInstance().post(
        lyrics + "?timestamp=${DateTime.now().millisecondsSinceEpoch}",
        params: {"id": songId});
  }
}

class Home {
  ///调用此接口 , 可获取 banner( 轮播图 ) 数据
  ///type:资源类型,对应以下类型,默认为 0 即PC 0: pc 1: android 2: iphone 3: ipad
  String banner = "/banner";

  ///首页圆形图标
  String dragonball = "/homepage/dragon/ball";

  ///首页主数据
  String mainData = "/homepage/block/page";
  //音乐日历，登录后调用
  String calendar = "/calendar";

  Future<Map> getBannerRequest(int type) async {
    return await HttpManager.getInstance().post(banner, params: {"type": type});
  }

  Future<Map> getDragonballRequest() async {
    return await HttpManager.getInstance().post(dragonball);
  }

  Future<Map> getHomeMainDataRequest(bool refresh) async {
    return await HttpManager.getInstance()
        .post(mainData, params: {"refresh": refresh});
  }

  Future<Map> getMusicCalendar() async {
    return await HttpManager.getInstance().post(calendar, params: {
      "startTime": Tools.getTimeInterval(dayoffset: 1),
      "endTime": Tools.getTimeInterval(dayoffset: 4),
    });
  }
}

class Login {
  ///登录接口
  String loginUrl = "/login/cellphone";

  ///刷新登录状态
  String refreshLogin = "/login/refresh";

  Future<Map> loginRequest(String phone, String password) async {
    return await HttpManager.getInstance()
        .post(loginUrl, params: {"phone": phone, "password": password});
  }

  Future<Map> loginRefreshRequest() async {
    return await HttpManager.getInstance().post(refreshLogin);
  }
}

class User {
  ///获取用户播放记录
  String record = "/user/record";

  Future<Map> getUserPlayRecordRequest() async {
    return await HttpManager.getInstance().post(record, params: {
      "uid": ApplicationManager.sharedInstance().loginInfo.profile.userId
    });
  }
}

class CommentAPI {
  ///获取评论列表
  /**
id : 资源 id, 如歌曲 id,mv id
tpye: 数字 , 资源类型 , 对应歌曲 , mv, 专辑 , 歌单 , 电台, 视频对应以下类型
0: 歌曲
1: mv
2: 歌单
3: 专辑
4: 电台
5: 视频
6: 动态
可选参数 :
pageNo:分页参数,第N页,默认为1
pageSize:分页参数,每页多少条数据,默认20
sortType: 排序方式,1:按推荐排序,2:按热度排序,3:按时间排序
cursor: 当sortType为3时且页数不是第一页时需传入,值为上一条数据的time
   */
  String commentList = "/comment/new";

  String commentLike = "/comment/like";

  ///t: 0删除, 1 发送, 2 回复id:对应资源 id, content :要发送的内容 commentId :回复的评论id (回复评论时必填)
  String commentOperation = "/comment";

  Future<Map> getCommentList(
      {id, type, pageNo, pageSize, sortType, cursor}) async {
    return await HttpManager.getInstance().post(
        commentList + "?timestamp=${DateTime.now().millisecondsSinceEpoch}",
        params: {
          "id": id,
          "type": type,
          "pageNo": pageNo,
          "pageSize": pageSize,
          "sortType": sortType,
          "cursor": cursor
        });
  }

  Future<Map> commentLikeRequest({num id, num cid, int t, int type}) async {
    return await HttpManager.getInstance().post(
        commentLike + "?timestamp=${DateTime.now().millisecondsSinceEpoch}",
        params: {"id": id, "cid": cid.toInt(), "t": t, "type": type});
  }

  Future<Map> commentOperationRequest(
      {int t, int type, num id, dynamic content, num commentId}) async {
    return await HttpManager.getInstance().post(commentOperation, params: {
      "t": t,
      "type": type,
      "id": id,
      "content": content,
      "commentId": commentId
    });
  }
}
