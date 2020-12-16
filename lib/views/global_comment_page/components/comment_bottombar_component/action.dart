import 'package:fish_redux/fish_redux.dart';

enum CommentBottombarAction { action, commitComment }

class CommentBottombarActionCreator {
  static Action onAction() {
    return const Action(CommentBottombarAction.action);
  }

  static Action onCommitComment() {
    return const Action(CommentBottombarAction.commitComment);
  }
}
