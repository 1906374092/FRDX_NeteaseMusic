import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_seekbar/seekbar/progress_value.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommonProgressbarState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommonProgressbarState>>{
      CommonProgressbarAction.update: _onUpdate,
      CommonProgressbarAction.onValueChanged: _onValueChanged,
      CommonProgressbarAction.onTapStart: _onTapStart,
      CommonProgressbarAction.onTapEnd: _onTapEnd
    },
  );
}

CommonProgressbarState _onUpdate(CommonProgressbarState state, Action action) {
  final CommonProgressbarState newState = state.clone();
  return newState;
}

CommonProgressbarState _onValueChanged(
    CommonProgressbarState state, Action action) {
  final CommonProgressbarState newState = state.clone();
  ProgressValue value = action.payload;
  newState.value = value.value;
  return newState;
}

CommonProgressbarState _onTapStart(
    CommonProgressbarState state, Action action) {
  final CommonProgressbarState newState = state.clone();
  newState.barHeight = 4;
  newState.indicatorRadius = 6;
  newState.progressTimeColor = Colors.white;
  newState.seeking = true;
  return newState;
}

CommonProgressbarState _onTapEnd(CommonProgressbarState state, Action action) {
  final CommonProgressbarState newState = state.clone();
  newState.barHeight = 2;
  newState.indicatorRadius = 4;
  newState.progressTimeColor = Colors.white.withOpacity(0.3);
  newState.seeking = false;
  newState.seekEndCallback != null
      ? newState.seekEndCallback(newState.value)
      : ApplicationManager.logger.w("not implement progressbar seek callback");
  return newState;
}
