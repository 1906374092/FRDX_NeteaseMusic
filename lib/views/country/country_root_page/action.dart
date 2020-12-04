import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CountryRootAction { action }

class CountryRootActionCreator {
  static Action onAction() {
    return const Action(CountryRootAction.action);
  }
}
