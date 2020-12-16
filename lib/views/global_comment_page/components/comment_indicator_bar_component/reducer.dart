import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentIndicatorBarState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentIndicatorBarState>>{
      CommentIndicatorBarAction.action: _onAction,
      CommentIndicatorBarAction.updateActiveIndex: _onUpdateActiveIndex
    },
  );
}

CommentIndicatorBarState _onAction(
    CommentIndicatorBarState state, Action action) {
  final CommentIndicatorBarState newState = state.clone();
  return newState;
}

CommentIndicatorBarState _onUpdateActiveIndex(
    CommentIndicatorBarState state, Action action) {
  final CommentIndicatorBarState newState = state.clone();
  newState.activeIndex = action.payload;
  return newState;
}
