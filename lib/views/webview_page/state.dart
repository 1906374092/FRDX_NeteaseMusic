import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class WebviewState implements Cloneable<WebviewState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  String url;
  String title;
  WebViewController controller;
  @override
  WebviewState clone() {
    return WebviewState()
      ..url = url
      ..controller = controller
      ..title = title;
  }
}

WebviewState initState(Map<String, dynamic> args) {
  String url = args["url"];
  return WebviewState()
    ..url = url
    ..controller = null
    ..title = "";
}
