import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(GlobalPlayerBackgroundState state, Dispatch dispatch,
    ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth,
    height: state.deviceInfo.screenHeight,
    color: Colors.blueGrey,
    child: Stack(
      children: [
        Container(
          width: state.deviceInfo.screenWidth,
          height: state.deviceInfo.screenHeight,
          child: state.coverUrl == null
              ? Image(
                  image: AssetImage("images/player/default_play_bg.jpg"),
                  fit: BoxFit.cover,
                )
              : CachedNetworkImage(
                  width: state.deviceInfo.screenWidth,
                  fit: BoxFit.cover,
                  imageUrl: state.coverUrl,
                  placeholder: (context, url) => Image(
                    image: AssetImage("images/player/default_play_bg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Center(
          child: ClipRect(
            //裁切长方形
            child: BackdropFilter(
              //背景滤镜器
              filter: ImageFilter.blur(
                  sigmaX: 20.0, sigmaY: 30.0), //图片模糊过滤，横向竖向都设置5.0
              child: Opacity(
                //透明控件
                opacity: 0.5,
                child: Container(
                  // 容器组件
                  width: state.deviceInfo.screenWidth,
                  height: state.deviceInfo.screenHeight,
                  decoration: BoxDecoration(
                      color: Colors.black87), //盒子装饰器，进行装饰，设置颜色为灰色,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
