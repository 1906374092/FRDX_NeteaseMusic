import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MineRootAction { action }

class MineRootActionCreator {
  static Action onAction() {
    return const Action(MineRootAction.action);
  }
}
