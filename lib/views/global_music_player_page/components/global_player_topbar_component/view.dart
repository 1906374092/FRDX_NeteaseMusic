import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    GlobalPlayerTopbarState state, Dispatch dispatch, ViewService viewService) {
  return Positioned(
    top: 0,
    left: 0,
    right: 0,
    child: Container(
      padding: EdgeInsets.only(top: state.deviceInfo.statusBarHeight),
      height: state.deviceInfo.naviBarHeight,
      child: Row(
        children: [
          CupertinoNavigationBarBackButton(
            color: Colors.white,
            onPressed: () {
              dispatch(GlobalPlayerTopbarActionCreator.onPopPage());
            },
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: state.deviceInfo.screenWidth - 98),
                  child: Text(
                    state.title ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  child: Text(
                    state.author ?? "",
                    style: TextStyle(
                        color: ColorDefine.Main_Light_Grey, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              ApplicationManager.logger.d("shared");
            },
            child: Container(
              width: 44,
              height: 44,
              child: Icon(
                XCIcons.share,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
