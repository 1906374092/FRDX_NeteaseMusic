import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentTopbarState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth,
    height: state.deviceInfo.naviBarHeight,
    // color: Colors.orange,
    alignment: Alignment.bottomLeft,
    child: Row(
      children: [
        Container(
          child: CupertinoNavigationBarBackButton(
            color: ColorDefine.Main_Subtitle_Text,
            onPressed: () {
              dispatch(CommentTopbarActionCreator.onBackAction());
            },
          ),
        ),
        Spacer(),
        Container(
          child: Text(
            "评论" + "(${state.total})",
            style: TextStyle(
                color: ColorDefine.Main_title_Text,
                fontSize: 19,
                fontWeight: FontWeight.w500),
          ),
        ),
        Spacer(),
        Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          child: Icon(
            XCIcons.share,
            color: ColorDefine.Main_Subtitle_Text,
            size: 23,
          ),
        )
      ],
    ),
  );
}
