import 'package:fish_redux/fish_redux.dart';

abstract class GlobalStoreBaseState {
  String playingSongId;
}

class GlobalStoreState
    implements Cloneable<GlobalStoreState>, GlobalStoreBaseState {
  @override
  String playingSongId;

  @override
  GlobalStoreState clone() {
    return GlobalStoreState();
  }
}

// GlobalStoreState initState(Map<String, dynamic> args) {
//   return GlobalStoreState();
// }
