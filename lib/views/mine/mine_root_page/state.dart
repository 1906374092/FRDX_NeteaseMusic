import 'package:fish_redux/fish_redux.dart';

class MineRootState implements Cloneable<MineRootState> {

  @override
  MineRootState clone() {
    return MineRootState();
  }
}

MineRootState initState(Map<String, dynamic> args) {
  return MineRootState();
}
