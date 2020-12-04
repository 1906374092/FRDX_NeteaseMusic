import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class CountrySelectState implements Cloneable<CountrySelectState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  HomeBlock block;

  @override
  CountrySelectState clone() {
    return CountrySelectState()..block = block;
  }
}
