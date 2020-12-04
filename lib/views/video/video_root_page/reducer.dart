import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VideoRootState> buildReducer() {
  return asReducer(
    <Object, Reducer<VideoRootState>>{
      VideoRootAction.action: _onAction,
    },
  );
}

VideoRootState _onAction(VideoRootState state, Action action) {
  final VideoRootState newState = state.clone();
  return newState;
}
