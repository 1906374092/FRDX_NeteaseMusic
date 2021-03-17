import 'package:fish_redux/fish_redux.dart';

enum HomePlayListAction { action, getAllData, updateOffset }

class HomePlayListActionCreator {
  static Action onAction() {
    return const Action(HomePlayListAction.action);
  }

  static Action onGetAllData() {
    return const Action(HomePlayListAction.getAllData);
  }

  static Action onUpdateOffset(double offset) {
    return Action(HomePlayListAction.updateOffset, payload: offset);
  }
}
