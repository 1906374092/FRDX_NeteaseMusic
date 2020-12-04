import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/views/common/common_button_component/state.dart';
import 'action.dart';
import 'state.dart';

Effect<DragonballComponentState> buildEffect() {
  return combineEffects(<Object, Effect<DragonballComponentState>>{
    DragonballComponentAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DragonballComponentState> ctx) {}
