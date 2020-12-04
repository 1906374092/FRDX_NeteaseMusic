import 'package:json_annotation/json_annotation.dart';
import "squareFeedViewDTOList.dart";
import "user_info.dart";
import "dynamicCover.dart";
import "liveUrl.dart";
part 'extInfo.g.dart';

@JsonSerializable()
class ExtInfo {
    ExtInfo();

    String moduleName;
    String moduleId;
    String orpheusUrl;
    String alg;
    String log_info;
    List<SquareFeedViewDTOList> squareFeedViewDTOList;
    num popularity;
    num verticalCoverId;
    String verticalCover;
    User_info userInfo;
    String coverTag;
    String privateTag;
    String borderTag;
    String startStreamTagName;
    List<String> tags;
    DynamicCover dynamicCover;
    num liveId;
    String title;
    num anchorId;
    num coverId;
    String cover;
    LiveUrl liveUrl;
    String playBackUrl;
    num orientationScope;
    num onlineNumber;
    num liveStatus;
    num startTime;
    num endTime;
    num roomId;
    String channelId;
    num liveType;
    num appKeyType;
    num type;
    num startStreamTag;
    num agoraRoomNo;
    String bgCoverUrl;
    String backgroundAnimateUrl;
    
    factory ExtInfo.fromJson(Map<String,dynamic> json) => _$ExtInfoFromJson(json);
    Map<String, dynamic> toJson() => _$ExtInfoToJson(this);
}
