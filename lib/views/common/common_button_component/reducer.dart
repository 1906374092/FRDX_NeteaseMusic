import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommonButtonState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommonButtonState>>{
      CommonButtonAction.action: _onAction,
      CommonButtonAction.getData: _onGetData
    },
  );
}

CommonButtonState _onAction(CommonButtonState state, Action action) {
  final CommonButtonState newState = state.clone();
  return newState;
}

CommonButtonState _onGetData(CommonButtonState state, Action action) {
  final CommonButtonState newState = state.clone();
  DragonBall dragonball = action.payload;
  newState.title = dragonball.name;
  newState.imageUrl = dragonball.iconUrl;
  return newState;
}
