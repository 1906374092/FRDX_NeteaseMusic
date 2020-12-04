import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GlobalPlayerCentercoverState state, Dispatch dispatch,
    ViewService viewService) {
  return GestureDetector(
    onTap: () {
      dispatch(GlobalPlayerCentercoverActionCreator.onHide());
    },
    child: Container(
      color: Colors.white.withOpacity(0),
      margin: EdgeInsets.only(top: state.deviceInfo.naviBarHeight),
      width: state.deviceInfo.screenWidth,
      height: state.deviceInfo.screenHeight -
          state.deviceInfo.naviBarHeight -
          210 -
          state.deviceInfo.bottomSafeArea,
      // color: Colors.blueGrey,
      child: Stack(
        children: [
          Positioned(
            top: 130,
            left: 40,
            child: Container(
              width: state.deviceInfo.screenWidth - 80,
              height: state.deviceInfo.screenWidth - 80,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                      (state.deviceInfo.screenWidth - 60) / 2)),
              padding: EdgeInsets.all(14),
              child: ClipOval(
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.1)),
                ),
              ),
            ),
          ),
          Positioned(
              top: 90,
              child: Listener(
                onPointerUp: (event) {
                  dispatch(GlobalPlayerCentercoverActionCreator.onPlay());
                },
                onPointerMove: (event) {
                  dispatch(GlobalPlayerCentercoverActionCreator.onPause());
                },
                child: Container(
                    width: state.deviceInfo.screenWidth,
                    height: state.deviceInfo.screenWidth,
                    child: Swiper(
                      onIndexChanged: (value) {
                        dispatch(GlobalPlayerCentercoverActionCreator
                            .onSwiperIndexChanged(value));
                      },
                      controller: state.swiperController,
                      itemCount: state.localPlayList.length == 0
                          ? 1
                          : state.localPlayList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: state.deviceInfo.screenWidth,
                          height: state.deviceInfo.screenWidth,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipOval(
                                child: Container(
                                  width: state.deviceInfo.screenWidth - 108,
                                  height: state.deviceInfo.screenWidth - 108,
                                  child: Image(
                                    image: AssetImage(
                                        "images/player/default_cover_play.jpg"),
                                  ),
                                ),
                              ),
                              RotationTransition(
                                turns: state.coverController,
                                child: Container(
                                  width: state.deviceInfo.screenWidth - 108,
                                  height: state.deviceInfo.screenWidth - 108,
                                  padding: EdgeInsets.all(45),
                                  child: ClipOval(
                                    child: Container(
                                      child: state.localPlayList.length == 0
                                          ? Container()
                                          : CachedNetworkImage(
                                              imageUrl: state
                                                  .localPlayList[index]
                                                  .album
                                                  .picUrl,
                                            ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )),
              )),
          Positioned(
              left: (state.deviceInfo.screenWidth - 150) / 2 + 35,
              child: Transform.rotate(
                origin: Offset(37, 41),
                alignment: Alignment.topLeft,
                angle: state.armAngle,
                child: Container(
                  // color: Colors.blue,
                  width: 150,
                  height: 240,
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage("images/player/play_needle_play.png"),
                  ),
                ),
              )),
        ],
      ),
    ),
  );
}
