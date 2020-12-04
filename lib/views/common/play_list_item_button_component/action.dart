import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlayListItemButtonAction { action }

class PlayListItemButtonActionCreator {
  static Action onAction() {
    return const Action(PlayListItemButtonAction.action);
  }
}
