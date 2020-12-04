import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MiniSongListState> buildReducer() {
  return asReducer(
    <Object, Reducer<MiniSongListState>>{
      MiniSongListAction.getData: _onGetData,
      MiniSongListAction.updatePlayingStatus: _onPlaySong,
    },
  );
}

MiniSongListState _onGetData(MiniSongListState state, Action action) {
  final MiniSongListState newState = state.clone();
  return newState;
}

MiniSongListState _onPlaySong(MiniSongListState state, Action action) {
  final MiniSongListState newState = state.clone();
  newState.playingSongId = action.payload;
  return newState;
}
