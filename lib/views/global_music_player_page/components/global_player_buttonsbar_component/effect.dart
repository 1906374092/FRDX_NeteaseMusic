import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalPlayerButtonsbarState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalPlayerButtonsbarState>>{
    GlobalPlayerButtonsbarAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GlobalPlayerButtonsbarState> ctx) {
}
