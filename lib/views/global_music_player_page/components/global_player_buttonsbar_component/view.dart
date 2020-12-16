import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GlobalPlayerButtonsbarState state, Dispatch dispatch,
    ViewService viewService) {
  return Positioned(
    top: state.deviceInfo.screenHeight - 200 - state.deviceInfo.bottomSafeArea,
    left: 0,
    right: 0,
    child: Container(
      height: 70,
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            XCIcons.like,
            color: ColorDefine.Inactive_Grey,
            size: 21,
          ),
          Spacer(),
          Icon(
            XCIcons.download,
            color: ColorDefine.Inactive_Grey,
          ),
          Spacer(),
          Icon(
            XCIcons.sing,
            color: ColorDefine.Inactive_Grey,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              dispatch(GlobalPlayerButtonsbarActionCreator.onTapComment());
            },
            child: Icon(
              XCIcons.comment,
              color: ColorDefine.Inactive_Grey,
            ),
          ),
          Spacer(),
          Icon(
            XCIcons.more,
            color: ColorDefine.Inactive_Grey,
          )
        ],
      ),
    ),
  );
}
