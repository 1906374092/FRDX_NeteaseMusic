import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommenPlaylistBannerAction { action }

class CommenPlaylistBannerActionCreator {
  static Action onAction() {
    return const Action(CommenPlaylistBannerAction.action);
  }
}
