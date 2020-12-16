import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

enum CommentListItemAction {
  action,
  likeAction,
  updateItem,
  updateLikeStatus,
  showActionSheet
}

class CommentListItemActionCreator {
  static Action onAction() {
    return const Action(CommentListItemAction.action);
  }

  static Action onLike(bool currentLikeStatus) {
    return Action(CommentListItemAction.likeAction, payload: currentLikeStatus);
  }

  static Action onUpdateItem() {
    return Action(CommentListItemAction.updateItem);
  }

  static Action onUpdateLikeStatus(bool newStatus, num commentId) {
    return Action(CommentListItemAction.updateLikeStatus,
        payload: {"status": newStatus, "id": commentId});
  }

  static Action onShowActionSheet() {
    return const Action(CommentListItemAction.showActionSheet);
  }
}
