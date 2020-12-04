import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';

class GlobalPlayerCentercoverState
    implements Cloneable<GlobalPlayerCentercoverState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  PlayerManager get playerManager =>
      ApplicationManager.sharedInstance().playerManager;
  AnimationController coverController;
  AnimationController armController;
  double armAngle = 0.0;
  String coverUrl;
  int currentIndex = 0;

  List<SongData> localPlayList = [];
  SwiperController swiperController;
  Function() hide;

  bool couldSwipe = false;
  @override
  GlobalPlayerCentercoverState clone() {
    return GlobalPlayerCentercoverState()
      ..coverUrl = coverUrl
      ..coverController = coverController
      ..armController = armController
      ..armAngle = armAngle
      ..hide = hide
      ..swiperController = swiperController
      ..currentIndex = currentIndex
      ..localPlayList = localPlayList
      ..couldSwipe = couldSwipe;
  }
}
