import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CountryRootState> buildEffect() {
  return combineEffects(<Object, Effect<CountryRootState>>{
    CountryRootAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CountryRootState> ctx) {
}
