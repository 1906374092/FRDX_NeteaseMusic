import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class CommentIndicatorBarState implements Cloneable<CommentIndicatorBarState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  int activeIndex = 0;
  @override
  CommentIndicatorBarState clone() {
    return CommentIndicatorBarState();
  }
}
