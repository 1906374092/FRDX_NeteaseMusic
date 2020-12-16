import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentTopbarState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentTopbarState>>{
      CommentTopbarAction.action: _onAction,
      CommentTopbarAction.updateTotal: _onUpdateTotal
    },
  );
}

CommentTopbarState _onAction(CommentTopbarState state, Action action) {
  final CommentTopbarState newState = state.clone();
  return newState;
}

CommentTopbarState _onUpdateTotal(CommentTopbarState state, Action action) {
  final CommentTopbarState newState = state.clone();
  newState.total = action.payload;
  return newState;
}
