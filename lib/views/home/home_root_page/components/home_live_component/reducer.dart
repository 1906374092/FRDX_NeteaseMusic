import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeLiveState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeLiveState>>{
      HomeLiveAction.updateData: _onUpdateData,
      HomeLiveAction.updateOffset: _onUpdateOffset
    },
  );
}

HomeLiveState _onUpdateData(HomeLiveState state, Action action) {
  final HomeLiveState newState = state.clone();
  return newState;
}

HomeLiveState _onUpdateOffset(HomeLiveState state, Action action) {
  final HomeLiveState newState = state.clone();
  newState.playListScrollOffset = action.payload;
  // print(action.payload);
  return newState;
}
