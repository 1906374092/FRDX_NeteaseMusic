import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class HomeLiveItemState implements Cloneable<HomeLiveItemState> {
  HomeLiveItemState({this.extInfo});
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  ExtInfo extInfo;
  @override
  HomeLiveItemState clone() {
    return HomeLiveItemState()..extInfo = extInfo;
  }
}
