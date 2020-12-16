import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentBottombarState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentBottombarState>>{
      CommentBottombarAction.action: _onAction,
    },
  );
}

CommentBottombarState _onAction(CommentBottombarState state, Action action) {
  final CommentBottombarState newState = state.clone();
  return newState;
}
