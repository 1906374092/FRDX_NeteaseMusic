import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MineRootState> buildReducer() {
  return asReducer(
    <Object, Reducer<MineRootState>>{
      MineRootAction.action: _onAction,
    },
  );
}

MineRootState _onAction(MineRootState state, Action action) {
  final MineRootState newState = state.clone();
  return newState;
}
