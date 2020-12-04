import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayListItemButtonState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayListItemButtonState>>{
      PlayListItemButtonAction.action: _onAction,
    },
  );
}

PlayListItemButtonState _onAction(PlayListItemButtonState state, Action action) {
  final PlayListItemButtonState newState = state.clone();
  return newState;
}
