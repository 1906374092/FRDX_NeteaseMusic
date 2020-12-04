import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommonButtonState state, Dispatch dispatch, ViewService viewService) {
  if (state == null) {
    return Container();
  }
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: state.width,
      height: state.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            width: state.imageSize,
            height: state.imageSize,
            decoration: BoxDecoration(
                color: state.backgroundColor,
                borderRadius: BorderRadius.circular(state.imageSize / 2),
                gradient: LinearGradient(
                    colors: [Colors.red[500], state.backgroundColor])),
            child: CachedNetworkImage(imageUrl: state.imageUrl),
          ),
          Spacer(),
          Text(
            state.title,
            style: TextStyle(
                color: ColorDefine.Button_Default_Title, fontSize: 12),
          ),
          Spacer()
        ],
      ),
    ),
  );
}
