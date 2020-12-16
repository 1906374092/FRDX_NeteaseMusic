import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommenPlaylistBannerState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommenPlaylistBannerState>>{
      CommenPlaylistBannerAction.action: _onAction,
    },
  );
}

CommenPlaylistBannerState _onAction(CommenPlaylistBannerState state, Action action) {
  final CommenPlaylistBannerState newState = state.clone();
  return newState;
}
