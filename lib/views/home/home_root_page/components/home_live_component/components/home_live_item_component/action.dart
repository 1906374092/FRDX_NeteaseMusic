import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeLiveItemAction { action }

class HomeLiveItemActionCreator {
  static Action onAction() {
    return const Action(HomeLiveItemAction.action);
  }
}
