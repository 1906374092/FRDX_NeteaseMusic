import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalCommentState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalCommentState>>{
      GlobalCommentAction.action: _onAction,
      GlobalCommentAction.indicatorShow: _onIndicatorShow,
    },
  );
}

GlobalCommentState _onAction(GlobalCommentState state, Action action) {
  final GlobalCommentState newState = state.clone();
  return newState;
}

GlobalCommentState _onIndicatorShow(GlobalCommentState state, Action action) {
  final GlobalCommentState newState = state.clone();
  newState.showIndicator = action.payload;
  return newState;
}
