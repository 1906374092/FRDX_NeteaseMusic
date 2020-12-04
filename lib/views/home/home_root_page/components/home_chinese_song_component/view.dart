import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/colors.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeChineseSongState state, Dispatch dispatch, ViewService viewService) {
  if (state.homeBlock == null) {
    return Container();
  }
  return Container(
    width: state.deviceInfo.screenWidth,
    height: 300,
    color: Colors.white,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
          height: 25,
          child: Row(
            children: [
              Container(
                child: Text(
                  state.homeBlock.uiElement.subTitle.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Spacer(),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 26,
                  padding: EdgeInsets.only(left: 8, right: 12),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: ColorDefine.Main_Light_Grey),
                      borderRadius: BorderRadius.circular(13)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow,
                        size: 18,
                        color: Colors.black,
                      ),
                      Text(
                        state.homeBlock.uiElement.button.text,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: state.deviceInfo.screenWidth + 30,
          height: 235,
          child: Stack(
            children: [
              Positioned(
                left: -30,
                child: Container(
                  width: state.deviceInfo.screenWidth + 30,
                  height: 235,
                  color: Colors.white,
                  child: PageView.builder(
                      controller: state.controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: viewService.buildAdapter().itemCount,
                      itemBuilder: viewService.buildAdapter().itemBuilder),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
