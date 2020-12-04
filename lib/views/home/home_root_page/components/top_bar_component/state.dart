import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/common/mini_player_component/state.dart';

class TopBarState implements Cloneable<TopBarState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  AnimationController coverRotateAnimationController;
  double musicPosition = 0;

  TopBarState();
  MiniPlayerState miniPlayerState;
  @override
  TopBarState clone() {
    return TopBarState()
      ..coverRotateAnimationController = coverRotateAnimationController
      ..musicPosition = musicPosition
      ..miniPlayerState = miniPlayerState;
  }
}

///mini player 连接器
class MiniPlayerStateConnector extends ConnOp<TopBarState, MiniPlayerState> {
  @override
  MiniPlayerState get(TopBarState state) {
    return state.miniPlayerState;
  }

  @override
  void set(TopBarState state, MiniPlayerState subState) {
    state.miniPlayerState = subState;
  }
}
