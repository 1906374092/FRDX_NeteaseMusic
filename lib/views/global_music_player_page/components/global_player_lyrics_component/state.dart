import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';

class GlobalPlayerLyricsState implements Cloneable<GlobalPlayerLyricsState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  PlayerManager get playerManager =>
      ApplicationManager.sharedInstance().playerManager;

  Function() hide;
  List<Map> lyrics;
  int activeline = 0;
  double volumeValue = 0;
  String lyricLineTimeText = "00:00";
  double lyricLineOpacity = 0.0;
  List<int> temp = []; //歌词时间数组
  int tempflag = 0;
  PageController pageController = PageController(viewportFraction: 0.1);

  @override
  GlobalPlayerLyricsState clone() {
    return GlobalPlayerLyricsState()
      ..hide = hide
      ..lyrics = lyrics
      ..volumeValue = volumeValue
      ..pageController = pageController
      ..activeline = activeline
      ..lyricLineTimeText = lyricLineTimeText
      ..lyricLineOpacity = lyricLineOpacity
      ..temp = temp
      ..tempflag = tempflag;
  }
}
