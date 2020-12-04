import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalPlayerTopbarState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalPlayerTopbarState>>{
      GlobalPlayerTopbarAction.updateInfo: _onUpdateInfo,
    },
  );
}

GlobalPlayerTopbarState _onUpdateInfo(
    GlobalPlayerTopbarState state, Action action) {
  final GlobalPlayerTopbarState newState = state.clone();
  Map data = action.payload;
  newState.title = data["title"];
  newState.author = data["author"];
  return newState;
}
