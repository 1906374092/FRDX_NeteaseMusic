import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentListviewState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentListviewState>>{
      CommentListviewAction.action: _onAction,
      CommentListviewAction.updateData: _onUpdateData,
    },
  );
}

CommentListviewState _onAction(CommentListviewState state, Action action) {
  final CommentListviewState newState = state.clone();
  return newState;
}

CommentListviewState _onUpdateData(CommentListviewState state, Action action) {
  final CommentListviewState newState = state.clone();
  newState.items = action.payload;
  return newState;
}
