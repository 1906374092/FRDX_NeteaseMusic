import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentBottombarState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(width: 1, color: Colors.grey[100]))),
    padding: EdgeInsets.all(10),
    alignment: Alignment.topCenter,
    constraints: BoxConstraints(
        minWidth: state.deviceInfo.screenWidth,
        maxHeight: 90,
        minHeight: state.deviceInfo.bottomSafeArea + 20),
    // color: Colors.orange,
    child: Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: state.deviceInfo.screenWidth - 80, maxHeight: 90),
          child: CupertinoTextField(
            controller: state.controller,
            focusNode: state.commentNode,
            decoration: BoxDecoration(border: Border()),
            maxLines: null,
            placeholder: "随乐而起，有感而发",
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            dispatch(CommentBottombarActionCreator.onCommitComment());
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "发送",
              style: TextStyle(color: ColorDefine.Button_Active_Text),
            ),
          ),
        )
      ],
    ),
  );
}
