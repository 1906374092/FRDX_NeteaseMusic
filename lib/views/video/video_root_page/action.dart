import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum VideoRootAction { action }

class VideoRootActionCreator {
  static Action onAction() {
    return const Action(VideoRootAction.action);
  }
}
