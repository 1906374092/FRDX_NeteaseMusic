import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommenPlaylistBannerState> buildEffect() {
  return combineEffects(<Object, Effect<CommenPlaylistBannerState>>{
    CommenPlaylistBannerAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommenPlaylistBannerState> ctx) {
}
