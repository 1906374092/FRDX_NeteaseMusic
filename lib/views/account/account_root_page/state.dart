import 'package:fish_redux/fish_redux.dart';

class AccountRootState implements Cloneable<AccountRootState> {

  @override
  AccountRootState clone() {
    return AccountRootState();
  }
}

AccountRootState initState(Map<String, dynamic> args) {
  return AccountRootState();
}
