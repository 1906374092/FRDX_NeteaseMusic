import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalPlayerButtonsbarState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalPlayerButtonsbarState>>{
      GlobalPlayerButtonsbarAction.action: _onAction,
    },
  );
}

GlobalPlayerButtonsbarState _onAction(
    GlobalPlayerButtonsbarState state, Action action) {
  final GlobalPlayerButtonsbarState newState = state.clone();
  return newState;
}
