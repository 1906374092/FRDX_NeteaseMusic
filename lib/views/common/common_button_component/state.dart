import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';

class CommonButtonState implements Cloneable<CommonButtonState> {
  CommonButtonState(
      {this.width = 80,
      this.height = 80,
      this.imageUrl = "",
      this.title = "",
      this.backgroundColor = ColorDefine.Main_Red,
      this.imageSize = 50});

  double width;
  double height;
  double imageSize;
  String imageUrl;
  String title;
  Color backgroundColor;

  @override
  CommonButtonState clone() {
    return CommonButtonState()
      ..width = width
      ..height = height
      ..imageSize = imageSize
      ..imageUrl = imageUrl
      ..title = title
      ..backgroundColor = backgroundColor;
  }
}

CommonButtonState initState(Map<String, dynamic> args) {
  return CommonButtonState();
}
