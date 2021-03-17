import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalPlayerLyricsState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalPlayerLyricsState>>{
      GlobalPlayerLyricsAction.update: _onUpdate,
      GlobalPlayerLyricsAction.updateVolumeValue: _onUpdateVolumeValue,
      GlobalPlayerLyricsAction.updateLyricsActiveLine: _onSetActiveLine,
      GlobalPlayerLyricsAction.showLyricLine: _onShowLyricLine,
    },
  );
}

GlobalPlayerLyricsState _onUpdate(
    GlobalPlayerLyricsState state, Action action) {
  final GlobalPlayerLyricsState newState = state.clone();
  return newState;
}

GlobalPlayerLyricsState _onUpdateVolumeValue(
    GlobalPlayerLyricsState state, Action action) {
  final GlobalPlayerLyricsState newState = state.clone();
  newState.volumeValue = action.payload;
  return newState;
}

GlobalPlayerLyricsState _onSetActiveLine(
    GlobalPlayerLyricsState state, Action action) {
  final GlobalPlayerLyricsState newState = state.clone();
  newState.activeline = action.payload;
  //设置歌词基准线时间
  Map lyricLineData = newState.lyrics[newState.activeline];
  String timeString = lyricLineData.keys.first;
  newState.lyricLineTimeText = timeString.split('.')[0];
  // newState.pageController.jumpToPage(action.payload);
  return newState;
}

GlobalPlayerLyricsState _onShowLyricLine(
    GlobalPlayerLyricsState state, Action action) {
  final GlobalPlayerLyricsState newState = state.clone();
  if (action.payload == true) {
    newState.lyricLineOpacity = 1.0;
  } else {
    newState.lyricLineOpacity = 0.0;
  }
  return newState;
}
