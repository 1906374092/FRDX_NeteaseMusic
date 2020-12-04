import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GlobalPlayerButtonsbarAction { action }

class GlobalPlayerButtonsbarActionCreator {
  static Action onAction() {
    return const Action(GlobalPlayerButtonsbarAction.action);
  }
}
