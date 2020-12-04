import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<VideoRootState> buildEffect() {
  return combineEffects(<Object, Effect<VideoRootState>>{
    VideoRootAction.action: _onAction,
  });
}

void _onAction(Action action, Context<VideoRootState> ctx) {
}
