import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class GlobalPlayerBackgroundState
    implements Cloneable<GlobalPlayerBackgroundState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  String coverUrl;
  @override
  GlobalPlayerBackgroundState clone() {
    return GlobalPlayerBackgroundState()..coverUrl = coverUrl;
  }
}
