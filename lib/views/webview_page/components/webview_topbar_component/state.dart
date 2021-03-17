import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class WebviewTopbarState implements Cloneable<WebviewTopbarState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  String title = "";
  @override
  WebviewTopbarState clone() {
    return WebviewTopbarState()..title = title;
  }
}
