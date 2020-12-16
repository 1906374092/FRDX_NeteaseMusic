import 'package:fish_redux/fish_redux.dart';

enum CommentIndicatorBarAction { action, updateActiveIndex }

class CommentIndicatorBarActionCreator {
  static Action onAction() {
    return const Action(CommentIndicatorBarAction.action);
  }

  static Action onUpdateActiveIndex(int activeIndex) {
    return Action(CommentIndicatorBarAction.updateActiveIndex,
        payload: activeIndex);
  }
}
