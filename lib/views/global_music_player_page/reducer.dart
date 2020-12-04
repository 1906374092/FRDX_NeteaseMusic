import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalMusicPlayerState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalMusicPlayerState>>{
      GlobalMusicPlayerAction.action: _onAction,
      GlobalMusicPlayerAction.showLyrics: _onShowLyrics,
      GlobalMusicPlayerAction.setLyricsData: _onSetLyrics,
    },
  );
}

GlobalMusicPlayerState _onAction(GlobalMusicPlayerState state, Action action) {
  final GlobalMusicPlayerState newState = state.clone();
  return newState;
}

GlobalMusicPlayerState _onShowLyrics(
    GlobalMusicPlayerState state, Action action) {
  final GlobalMusicPlayerState newState = state.clone();
  newState.showLyrics = action.payload;
  return newState;
}

GlobalMusicPlayerState _onSetLyrics(
    GlobalMusicPlayerState state, Action action) {
  final GlobalMusicPlayerState newState = state.clone();
  newState.globalPlayerLyricsState.lyrics = action.payload;
  if (newState.globalPlayerLyricsState.lyrics == null) {
    newState.globalPlayerLyricsState.temp = [];
    newState.globalPlayerLyricsState.tempflag = 0;
    newState.globalPlayerLyricsState.activeline = 0;
    return newState;
  }
  List<int> temp = [];
  for (var i = 0; i != newState.globalPlayerLyricsState.lyrics.length; ++i) {
    Map item = newState.globalPlayerLyricsState.lyrics[i];
    String durationString = item.keys.first;
    if (durationString == "") continue;
    String minute = durationString.split(":")[0];
    String second = durationString.split(":")[1].split(".")[0];
    String millSecond = durationString.split(":")[1].split(".")[1];
    int totalMillseconds = int.parse(minute) * 60 * 1000 +
        int.parse(second) * 1000 +
        int.parse(millSecond);
    temp.add(totalMillseconds);
  }
  newState.globalPlayerLyricsState.temp = temp;
  newState.globalPlayerLyricsState.tempflag = 0;
  newState.globalPlayerLyricsState.activeline = 0;
  return newState;
}
