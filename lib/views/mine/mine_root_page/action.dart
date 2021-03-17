import 'package:fish_redux/fish_redux.dart';

enum MineRootAction { action }

class MineRootActionCreator {
  static Action onAction() {
    return const Action(MineRootAction.action);
  }
}
