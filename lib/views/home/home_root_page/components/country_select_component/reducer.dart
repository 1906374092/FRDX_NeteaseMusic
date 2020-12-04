import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CountrySelectState> buildReducer() {
  return asReducer(
    <Object, Reducer<CountrySelectState>>{
      CountrySelectAction.upadteData: _onUpadteData,
    },
  );
}

CountrySelectState _onUpadteData(CountrySelectState state, Action action) {
  final CountrySelectState newState = state.clone();
  return newState;
}
