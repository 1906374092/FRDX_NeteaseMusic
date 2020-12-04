import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/manager/global_store/state.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class MiniSongListState implements Cloneable<MiniSongListState> {
  MiniSongListState({this.creative});
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  Creative creative;
  String playingSongId;
  @override
  MiniSongListState clone() {
    return MiniSongListState()
      ..creative = creative
      ..playingSongId = playingSongId;
  }
}
