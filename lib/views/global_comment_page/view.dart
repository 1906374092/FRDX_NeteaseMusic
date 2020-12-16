import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/keys.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    GlobalCommentState state, Dispatch dispatch, ViewService viewService) {
  return KeyboardAvoider(
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut,
    child: GestureDetector(
      onTap: () {
        dispatch(GlobalCommentActionCreator.onHideKeyboard());
      },
      child: Container(
        width: state.deviceInfo.screenWidth,
        height: state.deviceInfo.screenHeight,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: state.deviceInfo.naviBarHeight,
              left: 0,
              right: 0,
              child: viewService
                  .buildComponent(GlobalCommentComponentKeys.List_View_Key),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: viewService
                  .buildComponent(GlobalCommentComponentKeys.Top_Bar_Key),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: viewService
                  .buildComponent(GlobalCommentComponentKeys.Bottom_Bar_Key),
            ),
            Positioned(
              top: state.deviceInfo.naviBarHeight,
              left: 0,
              right: 0,
              child: Offstage(
                offstage: !state.showIndicator,
                child: Container(
                  child: viewService.buildComponent(
                      GlobalCommentComponentKeys.Indicator_Bar_Key),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
