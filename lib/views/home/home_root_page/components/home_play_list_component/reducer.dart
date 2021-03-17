import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomePlayListState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomePlayListState>>{
      HomePlayListAction.getAllData: _onGetAllData,
      HomePlayListAction.updateOffset: _onUpdateOffset
    },
  );
}

HomePlayListState _onGetAllData(HomePlayListState state, Action action) {
  final HomePlayListState newState = state.clone();
  return newState;
}

HomePlayListState _onUpdateOffset(HomePlayListState state, Action action) {
  final HomePlayListState newState = state.clone();
  newState.playListScrollOffset = action.payload;
  // print(action.payload);
  return newState;
}
