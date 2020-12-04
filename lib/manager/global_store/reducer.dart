import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalStoreState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalStoreState>>{
      GlobalStoreAction.changePlayingSongId: _onChangePlayingSongId,
    },
  );
}

GlobalStoreState _onChangePlayingSongId(GlobalStoreState state, Action action) {
  final GlobalStoreState newState = state.clone();
  newState.playingSongId = action.payload;
  return newState;
}
