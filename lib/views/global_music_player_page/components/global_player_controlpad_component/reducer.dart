import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalPlayerControlpadState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalPlayerControlpadState>>{
      GlobalPlayerControlpadAction.action: _onAction,
      GlobalPlayerControlpadAction.updatePlayingStatus: _onUpdatePlayingStatus,
      GlobalPlayerControlpadAction.updateProgressData: _onUpdateProgressData,
      GlobalPlayerControlpadAction.setPlayListOptionIcon: _onSetPlayOptionIcon
    },
  );
}

GlobalPlayerControlpadState _onAction(
    GlobalPlayerControlpadState state, Action action) {
  final GlobalPlayerControlpadState newState = state.clone();
  return newState;
}

GlobalPlayerControlpadState _onUpdatePlayingStatus(
    GlobalPlayerControlpadState state, Action action) {
  final GlobalPlayerControlpadState newState = state.clone();
  newState.isPlaying = action.payload;
  return newState;
}

GlobalPlayerControlpadState _onUpdateProgressData(
    GlobalPlayerControlpadState state, Action action) {
  final GlobalPlayerControlpadState newState = state.clone();
  Map data = action.payload;
  int current = data["current"];
  int total = data["total"];
  newState.commonProgressbarState.max = total.toDouble();
  newState.commonProgressbarState.value = current.toDouble();
  String totalMinute = total ~/ 60 >= 10 ? "${total ~/ 60}" : "0${total ~/ 60}";
  String totalSecond = total % 60 >= 10 ? "${total % 60}" : "0${total % 60}";
  String currentMinute =
      current ~/ 60 >= 10 ? "${current ~/ 60}" : "0${current ~/ 60}";
  String currentSecond =
      current % 60 >= 10 ? "${current % 60}" : "0${current % 60}";
  newState.commonProgressbarState.totalTimeText = "$totalMinute:$totalSecond";
  newState.commonProgressbarState.progressTimeText =
      "$currentMinute:$currentSecond";

  return newState;
}

GlobalPlayerControlpadState _onSetPlayOptionIcon(
    GlobalPlayerControlpadState state, Action action) {
  final GlobalPlayerControlpadState newState = state.clone();
  newState.playOptionIcon = action.payload;
  return newState;
}
