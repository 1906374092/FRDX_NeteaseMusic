import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';

class GlobalPlayerLocalplaylistState
    implements Cloneable<GlobalPlayerLocalplaylistState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  IconData playListOptionIcon = XCIcons.single_cycle;
  String playListOptionText = "单曲循环";

  List<SongData> localPlayList = [];

  Function(SongData song) itemTapCallback;
  @override
  GlobalPlayerLocalplaylistState clone() {
    return GlobalPlayerLocalplaylistState()
      ..playListOptionIcon = playListOptionIcon
      ..playListOptionText = playListOptionText
      ..localPlayList = localPlayList
      ..itemTapCallback = itemTapCallback;
  }
}
