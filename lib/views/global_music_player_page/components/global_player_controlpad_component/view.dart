import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/keys.dart';
import 'package:zmusic_flutter/views/common/keys.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GlobalPlayerControlpadState state, Dispatch dispatch,
    ViewService viewService) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: SafeArea(
      child: Container(
        height: 130,
        // color: Colors.orange,
        child: Column(
          children: [
            viewService
                .buildComponent(CommonComponentKeys.Common_Progressbar_Key),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      dispatch(GlobalPlayerControlpadActionCreator
                          .onChangePlayListOptionAction());
                    },
                    child: Container(
                      child: Icon(
                        state.playOptionIcon,
                        color: ColorDefine.Inactive_Grey,
                      ),
                    ),
                  ),
                  Spacer(),
                  CupertinoButton(
                    onPressed: () {
                      dispatch(
                          GlobalPlayerControlpadActionCreator.onPlayPrevious());
                    },
                    child: Container(
                      child: Icon(
                        Icons.skip_previous_outlined,
                        color: ColorDefine.Inactive_Grey,
                        size: 40,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (state.isPlaying) {
                        dispatch(GlobalPlayerControlpadActionCreator.onPause());
                      } else {
                        dispatch(GlobalPlayerControlpadActionCreator.onPlay());
                      }
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: ColorDefine.Inactive_Grey),
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        state.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: ColorDefine.Inactive_Grey,
                        size: 40,
                      ),
                    ),
                  ),
                  Spacer(),
                  CupertinoButton(
                    onPressed: () {
                      dispatch(
                          GlobalPlayerControlpadActionCreator.onPlayNext());
                    },
                    child: Container(
                      child: Icon(
                        Icons.skip_next_outlined,
                        color: ColorDefine.Inactive_Grey,
                        size: 40,
                      ),
                    ),
                  ),
                  Spacer(),
                  CupertinoButton(
                    onPressed: () {
                      dispatch(GlobalPlayerControlpadActionCreator
                          .onShowLocalPlaylist());
                    },
                    child: Container(
                      child: Icon(
                        XCIcons.play_list,
                        color: ColorDefine.Inactive_Grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
