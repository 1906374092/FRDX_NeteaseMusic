import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeMusicCalendarState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeMusicCalendarState>>{
      HomeMusicCalendarAction.changeIndex: _onChangeIndex,
      HomeMusicCalendarAction.setAnimation: _onSetAnimation,
      HomeMusicCalendarAction.getData: _onGetData,
    },
  );
}

HomeMusicCalendarState _onGetData(HomeMusicCalendarState state, Action action) {
  final HomeMusicCalendarState newState = state.clone();
  return newState;
}

HomeMusicCalendarState _onChangeIndex(
    HomeMusicCalendarState state, Action action) {
  final HomeMusicCalendarState newState = state.clone();
  newState.indexControl = action.payload;
  return newState;
}

HomeMusicCalendarState _onSetAnimation(
    HomeMusicCalendarState state, Action action) {
  final HomeMusicCalendarState newState = state.clone();
  newState.animation = action.payload;
  return newState;
}
