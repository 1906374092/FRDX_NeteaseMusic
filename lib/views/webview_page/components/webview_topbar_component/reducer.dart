import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/webview_page/action.dart';

import 'action.dart';
import 'state.dart';

Reducer<WebviewTopbarState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebviewTopbarState>>{
      WebviewTopbarAction.action: _onAction,
      WebviewAction.setTitle: _onSetTitle,
    },
  );
}

WebviewTopbarState _onAction(WebviewTopbarState state, Action action) {
  final WebviewTopbarState newState = state.clone();
  return newState;
}

WebviewTopbarState _onSetTitle(WebviewTopbarState state, Action action) {
  final WebviewTopbarState newState = state.clone();
  newState.title = action.payload;
  return newState;
}
