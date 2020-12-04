import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class GlobalPlayerButtonsbarState
    implements Cloneable<GlobalPlayerButtonsbarState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  @override
  GlobalPlayerButtonsbarState clone() {
    return GlobalPlayerButtonsbarState();
  }
}
