import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeLiveItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeLiveItemState>>{
      HomeLiveItemAction.action: _onAction,
    },
  );
}

HomeLiveItemState _onAction(HomeLiveItemState state, Action action) {
  final HomeLiveItemState newState = state.clone();
  return newState;
}
