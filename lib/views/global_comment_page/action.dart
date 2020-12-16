import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

enum GlobalCommentAction {
  action,
  indicatorShow,
  hideKeyboard,
  getIndicatorBar
}

class GlobalCommentActionCreator {
  static Action onAction() {
    return const Action(GlobalCommentAction.action);
  }

  static Action onindicatorShow(bool show) {
    return Action(GlobalCommentAction.indicatorShow, payload: show);
  }

  static Action onHideKeyboard() {
    return const Action(GlobalCommentAction.hideKeyboard);
  }

  static Action onGetIndicatorBar(Widget bar) {
    return Action(GlobalCommentAction.getIndicatorBar, payload: bar);
  }
}
