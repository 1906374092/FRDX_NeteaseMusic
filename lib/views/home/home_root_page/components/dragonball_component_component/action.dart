import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

enum DragonballComponentAction { action, updateItem, convertData }

class DragonballComponentActionCreator {
  static Action onAction() {
    return const Action(DragonballComponentAction.action);
  }

  static Action onUpdateItem() {
    return const Action(DragonballComponentAction.updateItem);
  }

  static Action onConvertData(List<DragonBall> dataList) {
    return Action(DragonballComponentAction.convertData);
  }
}
