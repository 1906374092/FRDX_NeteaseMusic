import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_play_list_component/adapter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomePlayListState state, Dispatch dispatch, ViewService viewService) {
  if (state.homeBlock == null) {
    return Container(
      height: 210,
    );
  }
  return Container(
    width: state.deviceInfo.screenWidth,
    margin: EdgeInsets.only(top: 5),
    height: 212,
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
                  padding: EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: ColorDefine.Main_Light_Grey),
                      borderRadius: BorderRadius.circular(13)),
                  child: Text(
                    state.homeBlock.uiElement.button.text,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              width: state.deviceInfo.screenWidth,
              height: 152,
              margin: EdgeInsets.only(top: 5, left: 10),
              child: ListView.builder(
                  padding: EdgeInsets.only(right: 15),
                  controller: state.controller,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemExtent: 120,
                  itemCount: viewService.buildAdapter().itemCount,
                  itemBuilder: viewService.buildAdapter().itemBuilder),
            ),
            Positioned(
              top: 0,
              right: state.playListScrollOffset,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: 50,
                height: 110,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 247, 248),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "左\n滑\n更\n多",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 189, 191, 192)),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
