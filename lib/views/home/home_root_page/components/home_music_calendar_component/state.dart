import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class HomeMusicCalendarState implements Cloneable<HomeMusicCalendarState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  CalendarResponse response;
  int indexControl = 0;
  Animation animation;
  double smallImageOpacity = 1;
  @override
  HomeMusicCalendarState clone() {
    return HomeMusicCalendarState()
      ..response = response
      ..indexControl = indexControl
      ..animation = animation
      ..smallImageOpacity = smallImageOpacity;
  }
}
