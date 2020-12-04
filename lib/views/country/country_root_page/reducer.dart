import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CountryRootState> buildReducer() {
  return asReducer(
    <Object, Reducer<CountryRootState>>{
      CountryRootAction.action: _onAction,
    },
  );
}

CountryRootState _onAction(CountryRootState state, Action action) {
  final CountryRootState newState = state.clone();
  return newState;
}
