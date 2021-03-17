import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/webview_page/components/webview_topbar_component/state.dart';

class WebviewState implements Cloneable<WebviewState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  String url;
  String title;
  WebViewController controller;

  WebviewTopbarState webviewTopbarState;
  @override
  WebviewState clone() {
    return WebviewState()
      ..url = url
      ..controller = controller
      ..title = title
      ..webviewTopbarState = webviewTopbarState;
  }
}

WebviewState initState(Map<String, dynamic> args) {
  String url = args["url"];
  return WebviewState()
    ..url = url
    ..controller = null
    ..title = ""
    ..webviewTopbarState = WebviewTopbarState();
}

class WebviewTopbarConnector extends ConnOp<WebviewState, WebviewTopbarState> {
  @override
  void set(WebviewState state, WebviewTopbarState subState) {
    state.webviewTopbarState = subState;
  }

  @override
  WebviewTopbarState get(WebviewState state) {
    return state.webviewTopbarState;
  }
}
