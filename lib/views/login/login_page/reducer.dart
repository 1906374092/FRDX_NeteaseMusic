import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.action: _onAction,
      LoginAction.configAnimation: _onConfigAnimation,
    },
  );
}

LoginState _onAction(LoginState state, Action action) {
  final LoginState newState = state.clone();
  return newState;
}

LoginState _onConfigAnimation(LoginState state, Action action) {
  final LoginState newState = state.clone();
  newState.controller = action.payload;
  return newState;
}
