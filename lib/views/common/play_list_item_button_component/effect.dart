import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PlayListItemButtonState> buildEffect() {
  return combineEffects(<Object, Effect<PlayListItemButtonState>>{
    PlayListItemButtonAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PlayListItemButtonState> ctx) {
}
