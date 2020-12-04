import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AccountRootState> buildEffect() {
  return combineEffects(<Object, Effect<AccountRootState>>{
    AccountRootAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AccountRootState> ctx) {
}
