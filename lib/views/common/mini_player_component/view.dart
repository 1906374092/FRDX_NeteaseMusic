import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MiniPlayerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              value: state.musicPosition,
              strokeWidth: 2,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
          RotationTransition(
            turns: state.coverRotateAnimationController,
            child: SizedBox(
              width: 26,
              height: 26,
              child: ClipOval(
                child: CachedNetworkImage(
                  width: 26,
                  height: 26,
                  fit: BoxFit.fill,
                  imageUrl:
                      "https://bkimg.cdn.bcebos.com/pic/8694a4c27d1ed21ba55e3ed0ae6eddc451da3f6b?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2U4MA==,g_7,xp_5,yp_5",
                  placeholder: (context, url) => Image(
                      image: AssetImage("images/player/mini_player_bg.png")),
                  errorWidget: (context, url, error) => Image(
                      image: AssetImage("images/player/mini_player_bg.png")),
                ),
              ),
            ),
          )
        ],
      ));
}
