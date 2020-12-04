import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seekbar/seekbar/seekbar.dart';
import 'package:sys_volume/flutter_volume.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    GlobalPlayerLyricsState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
      dispatch(GlobalPlayerLyricsActionCreator.onHide());
    },
    child: VolumeWatcher(
      watcher: (value) {
        dispatch(
            GlobalPlayerLyricsActionCreator.onUpdateVolumeValue(value.vol));
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        margin: EdgeInsets.only(top: state.deviceInfo.naviBarHeight),
        color: Colors.white.withOpacity(0),
        width: state.deviceInfo.screenWidth,
        height: state.deviceInfo.screenHeight -
            state.deviceInfo.naviBarHeight -
            210 -
            state.deviceInfo.bottomSafeArea,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      XCIcons.volume,
                      color: ColorDefine.Inactive_Grey,
                      size: 20,
                    ),
                  ),
                  Spacer(),
                  Container(
                      height: 20,
                      width: state.deviceInfo.screenWidth - 60 - 30 - 10,
                      child: SeekBar(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        indicatorColor: Colors.white,
                        progressColor: Colors.white.withOpacity(0.3),
                        indicatorRadius: 4,
                        min: 0,
                        max: 1,
                        value: state.volumeValue,
                        progresseight: 2,
                        onValueChanged: (value) {
                          FlutterVolume.set(value.value,
                              type: FlutterVolume.STREAM_MUSIC);
                        },
                        onTapStart: () {},
                        onTapEnd: () {},
                      )),
                  Spacer(),
                  Container(
                    child: Icon(
                      XCIcons.air_play,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: state.deviceInfo.screenWidth,
                  height: state.deviceInfo.screenHeight -
                      244 -
                      state.deviceInfo.naviBarHeight -
                      state.deviceInfo.bottomSafeArea,
                  // color: Colors.orange,
                  child: PageView.builder(
                    controller: state.pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: state.lyrics != null ? state.lyrics.length : 1,
                    onPageChanged: (value) {
                      if (value != state.activeline) {
                        dispatch(
                            GlobalPlayerLyricsActionCreator.onShowLyricLine(
                                true));
                        Future.delayed(Duration(seconds: 3), () {
                          dispatch(
                              GlobalPlayerLyricsActionCreator.onShowLyricLine(
                                  false));
                        });
                      }
                    },
                    itemBuilder: (context, index) {
                      if (state.lyrics == null) {
                        return Container(
                          alignment: Alignment.center,
                          width: state.deviceInfo.screenWidth,
                          child: Text(
                            "纯音乐，请欣赏",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        );
                      } else {
                        return Container(
                            alignment: Alignment.center,
                            width: state.deviceInfo.screenWidth,
                            height: 20,
                            child: Text(
                              state.lyrics[index].values.first,
                              style: TextStyle(
                                  color: index != state.activeline
                                      ? Colors.grey[400]
                                      : Colors.white,
                                  fontSize: 16),
                            ));
                      }
                    },
                  ),
                ),
                Positioned(
                  top: (state.deviceInfo.screenHeight -
                          296 -
                          state.deviceInfo.naviBarHeight -
                          state.deviceInfo.bottomSafeArea) /
                      2,
                  child: AnimatedOpacity(
                    opacity: state.lyricLineOpacity,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      width: state.deviceInfo.screenWidth - 30,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          CupertinoButton(
                            onPressed: () {
                              dispatch(GlobalPlayerLyricsActionCreator
                                  .onSeekLyricLine());
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              child: Icon(
                                Icons.play_arrow,
                                color: ColorDefine.Inactive_Grey,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 5, right: 5, top: 3),
                              color: ColorDefine.Inactive_Grey,
                              height: 1,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 20,
                            alignment: Alignment.center,
                            child: Text(
                              state.lyricLineTimeText,
                              style: TextStyle(
                                  color: ColorDefine.Inactive_Grey,
                                  fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
