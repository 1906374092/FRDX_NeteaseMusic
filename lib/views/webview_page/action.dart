import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum WebviewAction { action, createController, getTitle, setTitle }

class WebviewActionCreator {
  static Action onAction() {
    return const Action(WebviewAction.action);
  }

  static Action onCreateController(WebViewController controller) {
    return Action(WebviewAction.createController, payload: controller);
  }

  static Action onGetTitle() {
    return const Action(WebviewAction.getTitle);
  }

  static Action onSetTitle(String title) {
    return Action(WebviewAction.setTitle, payload: title);
  }
}
