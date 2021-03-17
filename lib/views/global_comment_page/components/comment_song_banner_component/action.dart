import 'package:fish_redux/fish_redux.dart';

enum CommentSongBannerAction { action }

class CommentSongBannerActionCreator {
  static Action onAction() {
    return const Action(CommentSongBannerAction.action);
  }
}
