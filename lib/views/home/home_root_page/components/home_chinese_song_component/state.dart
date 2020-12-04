import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/adapter.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/components/mini_song_list_component/state.dart';

class HomeChineseSongState extends MutableSource
    implements Cloneable<HomeChineseSongState> {
  HomeChineseSongState();
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  MiniSongListState miniSongListState;
  List<MiniSongListState> dataSource;
  HomeBlock homeBlock;
  PageController controller = PageController(viewportFraction: .85);
  @override
  HomeChineseSongState clone() {
    return HomeChineseSongState()
      ..homeBlock = homeBlock
      ..dataSource = dataSource
      ..controller = controller;
  }

  @override
  Object getItemData(int index) {
    return dataSource == null ? null : dataSource[index];
  }

  @override
  String getItemType(int index) {
    return MiniSongListAdapter.item_style;
  }

  @override
  int get itemCount => dataSource != null ? dataSource.length : 1;

  @override
  void setItemData(int index, Object data) {
    dataSource[index] = data;
  }
}
