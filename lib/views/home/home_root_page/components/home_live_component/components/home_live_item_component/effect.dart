import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeLiveItemState> buildEffect() {
  return combineEffects(<Object, Effect<HomeLiveItemState>>{
    HomeLiveItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomeLiveItemState> ctx) {
}
