import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

/// 建立一个AppStore
class GlobalStore {
  static Store<GlobalStoreState> _globalStore;
  static Store<GlobalStoreState> get store => _globalStore ??=
      createStore<GlobalStoreState>(GlobalStoreState(), buildReducer());
}
