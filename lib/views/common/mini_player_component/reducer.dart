import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MiniPlayerState> buildReducer() {
  return asReducer(
    <Object, Reducer<MiniPlayerState>>{
      MiniPlayerAction.action: _onAction,
      MiniPlayerAction.init: _onInit,
      MiniPlayerAction.changeProgress: _changeProgres
    },
  );
}

MiniPlayerState _onAction(MiniPlayerState state, Action action) {
  final MiniPlayerState newState = state.clone();
  return newState;
}

MiniPlayerState _onInit(MiniPlayerState state, Action action) {
  final MiniPlayerState newState = state.clone();
  newState.coverRotateAnimationController = action.payload;
  newState.musicPosition = 0.0;
  return newState;
}

MiniPlayerState _changeProgres(MiniPlayerState state, Action action) {
  final MiniPlayerState newState = state.clone();
  newState.musicPosition = action.payload;
  return newState;
}
