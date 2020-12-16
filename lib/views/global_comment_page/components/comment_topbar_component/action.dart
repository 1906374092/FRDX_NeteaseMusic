import 'package:fish_redux/fish_redux.dart';

enum CommentTopbarAction { action, backAction, updateTotal }

class CommentTopbarActionCreator {
  static Action onAction() {
    return const Action(CommentTopbarAction.action);
  }

  static Action onBackAction() {
    return const Action(CommentTopbarAction.backAction);
  }

  static Action onUpdateTotal(String total) {
    return Action(CommentTopbarAction.updateTotal, payload: total);
  }
}
