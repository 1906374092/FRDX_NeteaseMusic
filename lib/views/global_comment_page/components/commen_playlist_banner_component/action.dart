import 'package:fish_redux/fish_redux.dart';

enum CommenPlaylistBannerAction { action }

class CommenPlaylistBannerActionCreator {
  static Action onAction() {
    return const Action(CommenPlaylistBannerAction.action);
  }
}
