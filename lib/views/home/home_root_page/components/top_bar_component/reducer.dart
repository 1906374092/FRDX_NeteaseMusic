import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';

import 'action.dart';
import 'state.dart';

Reducer<TopBarState> buildReducer() {
  return asReducer(
    <Object, Reducer<TopBarState>>{
      TopBarAction.action: _onAction,
      TopBarAction.init: _onInit,
      TopBarAction.changeProgress: _changeProgres
    },
  );
}

TopBarState _onAction(TopBarState state, Action action) {
  final TopBarState newState = state.clone();
  return newState;
}

TopBarState _onInit(TopBarState state, Action action) {
  final TopBarState newState = state.clone();
  newState.coverRotateAnimationController = action.payload;
  newState.musicPosition = 0.0;
  return newState;
}

TopBarState _changeProgres(TopBarState state, Action action) {
  final TopBarState newState = state.clone();
  newState.musicPosition = action.payload;
  return newState;
}
