import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AccountRootState> buildReducer() {
  return asReducer(
    <Object, Reducer<AccountRootState>>{
      AccountRootAction.action: _onAction,
    },
  );
}

AccountRootState _onAction(AccountRootState state, Action action) {
  final AccountRootState newState = state.clone();
  return newState;
}
