import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/views/common/scroll_text.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    WebviewTopbarState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth,
    height: state.deviceInfo.naviBarHeight,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CupertinoNavigationBarBackButton(
          color: Colors.black,
          onPressed: () {
            dispatch(WebviewTopbarActionCreator.onPopAction());
          },
        ),
        Spacer(),
        CustomScrollTextComponent(
          width: 100,
          height: 44,
          title: state.title,
        ),
        Spacer(),
        Container(
          width: 44,
          height: 44,
        )
      ],
    ),
  );
}
