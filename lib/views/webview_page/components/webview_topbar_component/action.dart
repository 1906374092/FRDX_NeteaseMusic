import 'package:fish_redux/fish_redux.dart';

enum WebviewTopbarAction { action, popAction }

class WebviewTopbarActionCreator {
  static Action onAction() {
    return const Action(WebviewTopbarAction.action);
  }

  static Action onPopAction() {
    return const Action(WebviewTopbarAction.popAction);
  }
}
