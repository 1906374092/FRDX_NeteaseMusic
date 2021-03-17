import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/top_bar_component/action.dart';

import 'state.dart';

Widget buildView(
    TopBarState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth,
    height: state.deviceInfo.naviBarHeight,
    alignment: Alignment.bottomCenter,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            dispatch(TopBarActionCreator.onMicroPhoneTap());
          },
          child: Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            child: Icon(
              XCIcons.microphone,
              color: Colors.black,
            ),
          ),
        ),
        Spacer(),
        Container(
          width: state.deviceInfo.screenWidth - 44 * 2 - 5 * 2,
          height: 36,
          decoration: BoxDecoration(
              color: Color(0xFFeeeeee),
              borderRadius: BorderRadius.circular(18)),
          child: Row(
            children: [
              Spacer(),
              Container(
                child: Icon(
                  XCIcons.search,
                  color: Colors.grey[500],
                  size: 18,
                ),
              ),
              Container(
                child: Text(
                  "Shake it Off - Taylor Swift",
                  style: TextStyle(color: Colors.grey[400], fontSize: 16),
                ),
              ),
              Spacer()
            ],
          ),
        ),
        Spacer(),
        SizedBox(
          width: 44,
          height: 44,
        )
        // viewService.buildComponent(CommonComponentKeys.Mini_Player_Key)
      ],
    ),
  );
}
