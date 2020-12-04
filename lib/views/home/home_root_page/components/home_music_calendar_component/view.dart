import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/placeholder.dart';
import 'package:zmusic_flutter/utils/tools.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeMusicCalendarState state, Dispatch dispatch, ViewService viewService) {
  if (state.response == null ||
      state.response.data.calendarEvents.length == 0) {
    return Container();
  }
  return Container(
    width: state.deviceInfo.screenWidth - 34,
    height: 130,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 1.0), //阴影xy轴偏移量
              blurRadius: 1.0, //阴影模糊程度
              spreadRadius: 1.0 //阴影扩散程度
              )
        ]),
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.music_note_outlined,
              color: ColorDefine.Main_widget_red,
            ),
            Text("音乐日历",
                style: TextStyle(
                  color: ColorDefine.Main_widget_red,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: state.animation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Tools.getDateString(state.response.data
                          .calendarEvents[state.indexControl].onlineTime),
                      style: TextStyle(
                          color: ColorDefine.Main_title_Text,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Container(
                        constraints: BoxConstraints(
                            maxWidth: state.deviceInfo.screenWidth - 170),
                        child: Text(
                          state.response.data.calendarEvents[state.indexControl]
                              .title,
                          maxLines: 2,
                          style: TextStyle(
                              color: ColorDefine.Main_Subtitle_Text,
                              fontSize: 16),
                        ))
                  ],
                ),
                builder: (context, child) {
                  return Opacity(
                    opacity: state.animation.value,
                    child: child,
                  );
                },
              ),
              Spacer(),
              Container(
                width: 70,
                height: 60,
                child: Stack(
                  children: [
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: AnimatedBuilder(
                          animation: state.animation,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: state
                                        .response
                                        .data
                                        .calendarEvents[state.indexControl >=
                                                state.response.data
                                                        .calendarEvents.length -
                                                    1
                                            ? 0
                                            : state.indexControl + 1]
                                        .imgUrl,
                                    placeholder: (context, url) =>
                                        PlaceholderDefine
                                            .commonImagePlaceholder,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.white.withOpacity(0.3),
                                  )
                                ],
                              ),
                            ),
                          ),
                          builder: (context, child) {
                            return Opacity(
                              opacity: state.animation.value,
                              child: child,
                            );
                          },
                        )),
                    AnimatedBuilder(
                      child: CachedNetworkImage(
                        imageUrl: state.response.data
                            .calendarEvents[state.indexControl].imgUrl,
                        placeholder: (context, url) =>
                            PlaceholderDefine.commonImagePlaceholder,
                      ),
                      animation: state.animation,
                      builder: (context, child) {
                        return Positioned(
                          bottom: 0,
                          right: 10,
                          child: Opacity(
                            opacity: state.animation.value,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                    color: Colors.white,
                                    width: 60 * state.animation.value,
                                    height: 60 * state.animation.value,
                                    child: child)),
                          ),
                        );
                      },
                    )
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(5),
                    //   child: Container(
                    //     width: 60,
                    //     height: 60,
                    //     child: CachedNetworkImage(
                    //       imageUrl: state.response.data
                    //           .calendarEvents[state.indexControl].imgUrl,
                    //       placeholder: (context, url) =>
                    //           PlaceholderDefine.commonImagePlaceholder,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
