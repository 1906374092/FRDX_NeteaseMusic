import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class GlobalPlayerTopbarState implements Cloneable<GlobalPlayerTopbarState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  String title;
  String author;
  @override
  GlobalPlayerTopbarState clone() {
    return GlobalPlayerTopbarState()
      ..title = title
      ..author = author;
  }
}
