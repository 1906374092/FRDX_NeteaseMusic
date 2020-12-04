import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalPlayerCentercoverState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalPlayerCentercoverState>>{
      GlobalPlayerCentercoverAction.updateCover: _onUpdateCover,
      GlobalPlayerCentercoverAction.updateArmAngle: _onUpdateArmAngle,
      GlobalPlayerCentercoverAction.updateLocalPlayList: _onUpdateLocalPlayList,
      GlobalPlayerCentercoverAction.musicSwitch: _onMusicSwitch,
      GlobalPlayerCentercoverAction.setCouldSwipe: _onSetCouldSwipe
    },
  );
}

GlobalPlayerCentercoverState _onSetCouldSwipe(
    GlobalPlayerCentercoverState state, Action action) {
  final GlobalPlayerCentercoverState newState = state.clone();
  newState.couldSwipe = action.payload;
  return newState;
}

GlobalPlayerCentercoverState _onUpdateCover(
    GlobalPlayerCentercoverState state, Action action) {
  final GlobalPlayerCentercoverState newState = state.clone();
  newState.coverUrl = action.payload;
  return newState;
}

GlobalPlayerCentercoverState _onUpdateArmAngle(
    GlobalPlayerCentercoverState state, Action action) {
  final GlobalPlayerCentercoverState newState = state.clone();
  newState.armAngle = action.payload;
  return newState;
}

GlobalPlayerCentercoverState _onUpdateLocalPlayList(
    GlobalPlayerCentercoverState state, Action action) {
  final GlobalPlayerCentercoverState newState = state.clone();
  newState.localPlayList = action.payload;
  for (SongData item in newState.localPlayList) {
    if (item.id == newState.playerManager.sonngData.id) {
      newState.currentIndex =
          newState.playerManager.getCurrentPlayList.indexOf(item);
    }
  }
  Future.delayed(Duration(milliseconds: 300), () {
    newState.swiperController.move(newState.currentIndex, animation: false);
  });
  return newState;
}

GlobalPlayerCentercoverState _onMusicSwitch(
    GlobalPlayerCentercoverState state, Action action) {
  final GlobalPlayerCentercoverState newState = state.clone();
  Map data = action.payload;
  SwitchType type = data["type"];
  int index = data["index"];
  switch (type) {
    case SwitchType.previous:
      newState.swiperController.previous();
      newState.currentIndex--;
      break;
    case SwitchType.next:
      newState.swiperController.next();
      newState.currentIndex++;
      break;
    case SwitchType.any:
      newState.swiperController.move(index);
      // newState.currentIndex = index;
      break;
    default:
      break;
  }
  return newState;
}
