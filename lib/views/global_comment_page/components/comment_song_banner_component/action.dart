import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommentSongBannerAction { action }

class CommentSongBannerActionCreator {
  static Action onAction() {
    return const Action(CommentSongBannerAction.action);
  }
}
