import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

//TODO replace with your own action
enum CommonButtonAction { action, getData }

class CommonButtonActionCreator {
  static Action onAction() {
    return const Action(CommonButtonAction.action);
  }

  static Action onGetData(DragonBall data) {
    return Action(CommonButtonAction.getData, payload: data);
  }
}
