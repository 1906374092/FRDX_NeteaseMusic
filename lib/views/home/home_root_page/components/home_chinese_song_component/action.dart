import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

//TODO replace with your own action
enum HomeChineseSongAction { action, getData }

class HomeChineseSongActionCreator {
  static Action onAction() {
    return const Action(HomeChineseSongAction.action);
  }

  static Action onGetData() {
    return const Action(HomeChineseSongAction.getData);
  }
}
