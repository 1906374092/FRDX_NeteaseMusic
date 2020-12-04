import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MineRootState> buildEffect() {
  return combineEffects(<Object, Effect<MineRootState>>{
    MineRootAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MineRootState> ctx) {
}
