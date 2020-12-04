import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/common/play_list_item_button_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_play_list_component/adapter.dart';

class HomePlayListState extends MutableSource
    implements Cloneable<HomePlayListState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  HomeBlock homeBlock;
  double playListScrollOffset = -50;
  ScrollController controller = ScrollController();

  List<PlayListItemButtonState> items;
  @override
  HomePlayListState clone() {
    return HomePlayListState()
      ..homeBlock = homeBlock
      ..items = items
      ..playListScrollOffset = playListScrollOffset
      ..controller = controller;
  }

  @override
  Object getItemData(int index) {
    return items == null ? null : items[index];
  }

  @override
  String getItemType(int index) {
    return HomePlayListAdapter.item_style;
  }

  @override
  int get itemCount => items == null ? 1 : items.length;

  @override
  void setItemData(int index, Object data) {
    items[index] = data;
  }
}
