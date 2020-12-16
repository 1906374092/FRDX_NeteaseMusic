import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommentSongBannerState> buildEffect() {
  return combineEffects(<Object, Effect<CommentSongBannerState>>{
    CommentSongBannerAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommentSongBannerState> ctx) {
}
