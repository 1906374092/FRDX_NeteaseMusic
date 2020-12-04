import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/components/mini_song_list_component/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeChineseSongState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeChineseSongState>>{
      HomeChineseSongAction.action: _onAction,
      HomeChineseSongAction.getData: _onGetData,
    },
  );
}

HomeChineseSongState _onAction(HomeChineseSongState state, Action action) {
  final HomeChineseSongState newState = state.clone();
  return newState;
}

HomeChineseSongState _onGetData(HomeChineseSongState state, Action action) {
  final HomeChineseSongState newState = state.clone();
  return newState;
}
