import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/views/common/common_button_component/state.dart';
import 'package:zmusic_flutter/views/common/play_list_item_button_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/components/mini_song_list_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_live_component/components/home_live_item_component/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeRootState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeRootState>>{
      HomeRootAction.updateDaytimeData: _onUpdateDayTimeData,
      HomeRootAction.updateMusicCalendar: _onUpdateMusicCalendar,
      HomeRootAction.updateHomePlaylist: _onUpdateHomePlaylist,
      HomeRootAction.updateHomeChineseSong: _onUpdateHomeChineseSong,
      HomeRootAction.updateDragonBall: _onUpdateDragonBall,
      HomeRootAction.updateBanner: _onUpdateBanner,
      HomeRootAction.updateCountrySelect: _onUpdateCountrySelect,
      HomeRootAction.updateLive: _onUpdateLive,
    },
  );
}

HomeRootState _onUpdateBanner(HomeRootState state, Action action) {
  final HomeRootState newState = state.clone();
  newState.swiperState.banners = action.payload;
  return newState;
}

HomeRootState _onUpdateDragonBall(HomeRootState state, Action action) {
  final HomeRootState newState = state.clone();
  List<DragonBall> datas = action.payload;
  List<CommonButtonState> stateList = List.generate(datas.length, (index) {
    return CommonButtonState(
        title: datas[index].name, imageUrl: datas[index].iconUrl);
  });
  newState.dragonballState.dragonballs = stateList;
  return newState;
}

HomeRootState _onUpdateHomePlaylist(HomeRootState state, Action action) {
  final HomeRootState newState = state.clone();
  HomeBlock block = action.payload;
  List<PlayListItemButtonState> itemList =
      List.generate(block.creatives.length, (index) {
    return PlayListItemButtonState(creative: block.creatives[index]);
  });
  newState.homePlayListState.homeBlock = block;
  newState.homePlayListState.items = itemList;
  return newState;
}

HomeRootState _onUpdateHomeChineseSong(HomeRootState state, Action action) {
  final HomeRootState newState = state.clone();
  HomeBlock block = action.payload;
  List<MiniSongListState> itemList =
      List.generate(block.creatives.length, (index) {
    return MiniSongListState(creative: block.creatives[index]);
  });
  newState.homeChineseSongState.homeBlock = block;
  newState.homeChineseSongState.dataSource = itemList;
  return newState;
}

HomeRootState _onUpdateMusicCalendar(HomeRootState state, Action action) {
  final HomeRootState newState = state.clone();
  newState.homeMusicCalendarState.response = action.payload;
  return newState;
}

HomeRootState _onUpdateDayTimeData(HomeRootState state, Action action) {
  final HomeRootState newState = state.clone();
  HomeBlock block = action.payload;
  List<PlayListItemButtonState> itemList =
      List.generate(block.creatives.length, (index) {
    return PlayListItemButtonState(creative: block.creatives[index]);
  });

  newState.dayTimePlayListState.homeBlock = block;
  newState.dayTimePlayListState.items = itemList;
  return newState;
}

HomeRootState _onUpdateCountrySelect(HomeRootState state, Action action) {
  final HomeRootState newState = state.clone();
  newState.countrySelectState.block = action.payload;
  return newState;
}

HomeRootState _onUpdateLive(HomeRootState state, Action action) {
  final HomeRootState newState = state.clone();
  HomeBlock block = action.payload;
  List<HomeLiveItemState> items = List.generate(block.extInfo.length, (index) {
    return HomeLiveItemState(extInfo: block.extInfo[index]);
  });
  newState.homeLiveState.block = block;
  newState.homeLiveState.items = items;
  return newState;
}
