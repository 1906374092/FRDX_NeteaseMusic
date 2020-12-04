import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalPlayerLocalplaylistState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalPlayerLocalplaylistState>>{
      GlobalPlayerLocalplaylistAction.action: _onAction,
      GlobalPlayerLocalplaylistAction.setPlayOption: _onSetPlayOption,
      GlobalPlayerLocalplaylistAction.setLocalPlayList: _onSetLocalPlayList
    },
  );
}

GlobalPlayerLocalplaylistState _onAction(
    GlobalPlayerLocalplaylistState state, Action action) {
  final GlobalPlayerLocalplaylistState newState = state.clone();
  return newState;
}

GlobalPlayerLocalplaylistState _onSetPlayOption(
    GlobalPlayerLocalplaylistState state, Action action) {
  final GlobalPlayerLocalplaylistState newState = state.clone();
  PlayListOption option = action.payload;
  switch (option) {
    case PlayListOption.RandomCycle:
      newState.playListOptionIcon = XCIcons.random_play;
      newState.playListOptionText = "随机播放";
      break;
    case PlayListOption.OrderCycle:
      newState.playListOptionIcon = XCIcons.sequential_play;
      newState.playListOptionText = "列表循环";
      break;
    case PlayListOption.SingleCycle:
      newState.playListOptionIcon = XCIcons.single_cycle;
      newState.playListOptionText = "单曲循环";
      break;
    default:
  }
  return newState;
}

GlobalPlayerLocalplaylistState _onSetLocalPlayList(
    GlobalPlayerLocalplaylistState state, Action action) {
  final GlobalPlayerLocalplaylistState newState = state.clone();
  newState.localPlayList = action.payload;
  return newState;
}
