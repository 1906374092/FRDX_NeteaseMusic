import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_live_component/adapter.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_live_component/components/home_live_item_component/state.dart';

class HomeLiveState extends MutableSource implements Cloneable<HomeLiveState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  HomeBlock block;
  double playListScrollOffset = -50;
  ScrollController controller = ScrollController();
  @override
  HomeLiveState clone() {
    return HomeLiveState()
      ..block = block
      ..items = items;
  }

  List<HomeLiveItemState> items;
  @override
  Object getItemData(int index) {
    return items == null ? null : items[index];
  }

  @override
  String getItemType(int index) {
    return HomeLiveAdapter.item_style;
  }

  @override
  int get itemCount => items == null ? 1 : items.length;

  @override
  void setItemData(int index, Object data) {
    items[index] = data;
  }
}
