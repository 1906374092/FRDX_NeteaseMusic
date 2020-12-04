import 'package:fish_redux/fish_redux.dart';

enum GlobalStoreAction { changePlayingSongId }

class GlobalStoreActionCreator {
  static Action onChangePlayingSongId(String playingSongId) {
    return const Action(GlobalStoreAction.changePlayingSongId);
  }
}
