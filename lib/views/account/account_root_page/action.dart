import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AccountRootAction { action }

class AccountRootActionCreator {
  static Action onAction() {
    return const Action(AccountRootAction.action);
  }
}
