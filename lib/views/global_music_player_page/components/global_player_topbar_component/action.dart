import 'package:fish_redux/fish_redux.dart';

enum GlobalPlayerTopbarAction { popPage, updateInfo }

class GlobalPlayerTopbarActionCreator {
  static Action onPopPage() {
    return const Action(GlobalPlayerTopbarAction.popPage);
  }

  static Action onUpdateInfo(Map data) {
    return Action(GlobalPlayerTopbarAction.updateInfo, payload: data);
  }
}
