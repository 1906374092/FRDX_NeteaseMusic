import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/common/common_progressbar_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_localplaylist_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';

class GlobalPlayerControlpadState
    implements Cloneable<GlobalPlayerControlpadState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  PlayerManager get playerManager =>
      ApplicationManager.sharedInstance().playerManager;

  CommonProgressbarState commonProgressbarState;
  GlobalPlayerLocalplaylistState globalPlayerLocalplaylistState;

  IconData playOptionIcon;

  bool isPlaying = true;

  List<SongData> get currentPlayList =>
      ApplicationManager.sharedInstance().playerManager.getCurrentPlayList;

  Function() changeSongCallback;
  @override
  GlobalPlayerControlpadState clone() {
    return GlobalPlayerControlpadState()
      ..commonProgressbarState = commonProgressbarState
      ..isPlaying = isPlaying
      ..globalPlayerLocalplaylistState = globalPlayerLocalplaylistState
      ..playOptionIcon = playOptionIcon
      ..changeSongCallback = changeSongCallback;
  }
}

class CommonProgressbarConnector
    extends ConnOp<GlobalPlayerControlpadState, CommonProgressbarState> {
  @override
  void set(GlobalPlayerControlpadState state, CommonProgressbarState subState) {
    state.commonProgressbarState = subState;
  }

  @override
  CommonProgressbarState get(GlobalPlayerControlpadState state) {
    return state.commonProgressbarState;
  }
}

///本地播放列表连接器
class GlobalPlayerLocalplaylistConnector extends ConnOp<
    GlobalPlayerControlpadState, GlobalPlayerLocalplaylistState> {
  @override
  void set(GlobalPlayerControlpadState state,
      GlobalPlayerLocalplaylistState subState) {
    state.globalPlayerLocalplaylistState = subState;
  }

  @override
  GlobalPlayerLocalplaylistState get(GlobalPlayerControlpadState state) {
    return state.globalPlayerLocalplaylistState;
  }
}
