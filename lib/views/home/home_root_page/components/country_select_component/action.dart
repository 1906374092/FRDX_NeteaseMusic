import 'package:fish_redux/fish_redux.dart';

enum CountrySelectAction { upadteData }

class CountrySelectActionCreator {
  static Action upadteData() {
    return const Action(CountrySelectAction.upadteData);
  }
}
