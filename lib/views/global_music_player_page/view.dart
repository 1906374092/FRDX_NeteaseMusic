import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/keys.dart';
import 'state.dart';

Widget buildView(
    GlobalMusicPlayerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
      width: state.deviceInfo.screenWidth,
      height: state.deviceInfo.screenHeight,
      color: Colors.white,
      alignment: Alignment.center,
      child: Stack(
        children: [
          viewService
              .buildComponent(GlobalMusicPlayerPageKeys.Back_Component_Key),
          viewService
              .buildComponent(GlobalMusicPlayerPageKeys.Topbar_Component_Key),
          Offstage(
            offstage: !state.showLyrics,
            child: viewService
                .buildComponent(GlobalMusicPlayerPageKeys.Lyrics_Component_Key),
          ),
          Offstage(
            offstage: state.showLyrics,
            child: viewService.buildComponent(
                GlobalMusicPlayerPageKeys.Centercover_Component_Key),
          ),
          viewService.buildComponent(
              GlobalMusicPlayerPageKeys.Buttonsbar_Component_Key),
          viewService.buildComponent(
              GlobalMusicPlayerPageKeys.Controlspad_Component_key),
        ],
      ));
}
