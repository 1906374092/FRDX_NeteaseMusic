import 'package:flutter/material.dart';

class DeviceInfo {
  DeviceInfo(this.context);
  BuildContext context;

  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get naviBarHeight => MediaQuery.of(context).padding.top + 44;

  double get bottomBarHeight => MediaQuery.of(context).padding.bottom + 49;

  double get statusBarHeight => MediaQuery.of(context).padding.top;

  double get bottomSafeArea => MediaQuery.of(context).padding.bottom;
}
