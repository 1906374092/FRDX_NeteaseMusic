import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/views/common/common_button_component/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<DragonballComponentState> buildReducer() {
  return asReducer(
    <Object, Reducer<DragonballComponentState>>{
      DragonballComponentAction.action: _onAction,
      DragonballComponentAction.updateItem: _onUpdateItem
    },
  );
}

DragonballComponentState _onAction(
    DragonballComponentState state, Action action) {
  final DragonballComponentState newState = state.clone();
  return newState;
}

DragonballComponentState _onUpdateItem(
    DragonballComponentState state, Action action) {
  final DragonballComponentState newState = state.clone();
  return newState;
}
