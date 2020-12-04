import 'package:fish_redux/fish_redux.dart';

class CountryRootState implements Cloneable<CountryRootState> {

  @override
  CountryRootState clone() {
    return CountryRootState();
  }
}

CountryRootState initState(Map<String, dynamic> args) {
  return CountryRootState();
}
