/*
 * @Description: 
 * @Author: zhangyf
 * @Date: 2020-11-12 13:42:16
 * @LastEditTime: 2020-11-12 13:57:05
 * @LastEditors: zhangyf
 */
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';

class PlaceholderDefine {
  static Container commonImagePlaceholder = Container(
    color: ColorDefine.Main_Light_Grey,
    child: Icon(
      XCIcons.home,
      size: 20,
      color: Color(0xFF999999),
    ),
  );
}
