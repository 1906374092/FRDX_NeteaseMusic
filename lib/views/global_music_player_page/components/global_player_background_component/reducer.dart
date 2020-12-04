import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalPlayerBackgroundState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalPlayerBackgroundState>>{
      GlobalPlayerBackgroundAction.updateCover: _onUpdateCoverUrl,
    },
  );
}

GlobalPlayerBackgroundState _onUpdateCoverUrl(
    GlobalPlayerBackgroundState state, Action action) {
  final GlobalPlayerBackgroundState newState = state.clone();
  newState.coverUrl = action.payload;
  return newState;
}
