import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class CommonProgressbarState implements Cloneable<CommonProgressbarState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  AnimationController barSizeController;

  Color progressTimeColor = Colors.white.withOpacity(0.3);

  String progressTimeText = "00:00";
  String totalTimeText = "00:00";
  double max = 180;
  double value = 0;
  double barHeight = 2;
  double indicatorRadius = 4;
  bool draging = false;

  bool seeking = false;

  Function(double value) seekEndCallback;
  @override
  CommonProgressbarState clone() {
    return CommonProgressbarState()
      ..progressTimeText = progressTimeText
      ..totalTimeText = totalTimeText
      ..max = max
      ..value = value
      ..barHeight = barHeight
      ..indicatorRadius = indicatorRadius
      ..draging = draging
      ..barSizeController = barSizeController
      ..progressTimeColor = progressTimeColor
      ..seeking = seeking
      ..seekEndCallback = seekEndCallback;
  }
}
