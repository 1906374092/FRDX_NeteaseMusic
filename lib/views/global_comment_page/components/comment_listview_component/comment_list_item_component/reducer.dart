import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentListItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentListItemState>>{
      CommentListItemAction.action: _onAction,
      CommentListItemAction.updateItem: _onUpdateItem,
      CommentListItemAction.updateLikeStatus: _onUpdateLikeStatus,
    },
  );
}

CommentListItemState _onAction(CommentListItemState state, Action action) {
  final CommentListItemState newState = state.clone();
  return newState;
}

CommentListItemState _onUpdateItem(CommentListItemState state, Action action) {
  final CommentListItemState newState = state.clone();
  return newState;
}

CommentListItemState _onUpdateLikeStatus(
    CommentListItemState state, Action action) {
  final CommentListItemState newState = state.clone();
  Map data = action.payload;
  bool status = data["status"];
  num id = data["id"];
  if (id == state.commentModel.commentId) {
    newState.liked = status;
    if (status) {
      newState.likedCount++;
    } else {
      newState.likedCount--;
    }
    return newState;
  } else {
    return state;
  }
}
