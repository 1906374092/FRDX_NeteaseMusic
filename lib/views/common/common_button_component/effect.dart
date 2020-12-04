import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommonButtonState> buildEffect() {
  return combineEffects(<Object, Effect<CommonButtonState>>{
    CommonButtonAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommonButtonState> ctx) {
}
