import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class CommentTopbarState implements Cloneable<CommentTopbarState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  String total = "";
  @override
  CommentTopbarState clone() {
    return CommentTopbarState()..total = total;
  }
}
