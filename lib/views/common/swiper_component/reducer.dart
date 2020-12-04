import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<SwiperState> buildReducer() {
  return asReducer(
    <Object, Reducer<SwiperState>>{
      SwiperAction.action: _onAction,
      SwiperAction.init: _onInit,
      SwiperAction.getBanner: _onGetBanner
    },
  );
}

SwiperState _onAction(SwiperState state, Action action) {
  final SwiperState newState = state.clone();
  return newState;
}

SwiperState _onInit(SwiperState state, Action action) {
  final SwiperState newState = state.clone();
  return newState;
}

SwiperState _onGetBanner(SwiperState state, Action action) {
  final SwiperState newState = state.clone();
  // newState.banners = action.payload;
  return newState;
}
