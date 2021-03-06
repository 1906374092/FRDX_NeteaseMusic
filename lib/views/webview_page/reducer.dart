import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WebviewState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebviewState>>{
      WebviewAction.action: _onAction,
      WebviewAction.createController: _onCreateController,
    },
  );
}

WebviewState _onAction(WebviewState state, Action action) {
  final WebviewState newState = state.clone();
  return newState;
}

WebviewState _onCreateController(WebviewState state, Action action) {
  final WebviewState newState = state.clone();
  newState.controller = action.payload;
  return newState;
}
