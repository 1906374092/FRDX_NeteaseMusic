import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

//TODO replace with your own action
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
