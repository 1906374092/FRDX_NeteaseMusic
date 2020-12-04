import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';

class StorageManager {
  StorageManager._();
  static StorageManager _manager;
  SharedPreferences _db;

  static Future<StorageManager> getInstance() async {
    if (_manager == null) {
      _manager = StorageManager._();
      _manager._db = await SharedPreferences.getInstance();
    }
    return _manager;
  }

  ///缓存用户信息
  set loginInfo(Map userInfo) {
    this._db.setString("USER_INFO", json.encode(userInfo));
  }

  Map get loginInfo {
    try {
      String userJson = this._db.getString("USER_INFO");
      if (userJson != null) {
        return json.decode(userJson);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  ///缓存播放顺序设置
  set playListOption(PlayListOption option) {
    switch (option) {
      case PlayListOption.SingleCycle:
        this._db.setString("PlayListOption", "SingleCycle");
        break;
      case PlayListOption.RandomCycle:
        this._db.setString("PlayListOption", "RandomCycle");
        break;
      case PlayListOption.OrderCycle:
        this._db.setString("PlayListOption", "OrderCycle");
        break;
      default:
    }
  }

  PlayListOption get playListOption {
    String option = this._db.getString("PlayListOption");
    switch (option) {
      case "SingleCycle":
        return PlayListOption.SingleCycle;
      case "RandomCycle":
        return PlayListOption.RandomCycle;
      case "OrderCycle":
        return PlayListOption.OrderCycle;
      default:
        return PlayListOption.OrderCycle;
    }
  }

  ///本地播放列表缓存
  set localPlayList(List<SongData> data) {
    List<String> jsonList = List.generate(data.length, (index) {
      SongData song = data[index];
      String songJson = json.encode(song.toJson());
      return songJson;
    });
    this._db.setStringList("Local_Play_List", jsonList);
  }

  List<SongData> get localPlayList {
    try {
      List<String> jsonList = this._db.getStringList("Local_Play_List");
      List<SongData> result = List.generate(jsonList.length, (index) {
        String songJson = jsonList[index];
        Map songMap = json.decode(songJson);
        SongData songData = SongData.fromJson(songMap);
        return songData;
      });
      return result;
    } catch (e) {
      return null;
    }
  }

  addToLocalPlayList(SongData data) {
    List<SongData> originList = this.localPlayList;
    if (originList == null) {
      originList = [];
    }
    bool containFlag = false;
    for (SongData item in originList) {
      if (item.id == data.id) {
        containFlag = true;
      }
    }
    if (!containFlag) {
      originList.add(data);
    }
    this.localPlayList = originList;
  }

  removeFromLocalPlayList(num id) {
    List<SongData> originList = this.localPlayList;
    for (SongData item in originList) {
      if (item.id == id) {
        originList.remove(item);
        this.localPlayList = originList;
      }
    }
  }

  removeAllFromLocalPlayList() {
    this._db.remove("Local_Play_List");
  }
}
