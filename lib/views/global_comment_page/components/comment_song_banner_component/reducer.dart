import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentSongBannerState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentSongBannerState>>{
      CommentSongBannerAction.action: _onAction,
    },
  );
}

CommentSongBannerState _onAction(CommentSongBannerState state, Action action) {
  final CommentSongBannerState newState = state.clone();
  return newState;
}
