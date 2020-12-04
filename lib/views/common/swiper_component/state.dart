import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/banners.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class SwiperState implements Cloneable<SwiperState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  Banners banners;

  @override
  SwiperState clone() {
    return SwiperState()..banners = banners;
  }
}

SwiperState initState(Map<String, dynamic> args) {
  return SwiperState();
}
