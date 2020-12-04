import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

enum MiniPlayerAction { action, init, changeProgress }

class MiniPlayerActionCreator {
  static Action onAction() {
    return const Action(MiniPlayerAction.action);
  }

  static Action onInit(AnimationController controller) {
    return Action(MiniPlayerAction.init, payload: controller);
  }

  static Action onChangeProgress(double posison) {
    return Action(MiniPlayerAction.changeProgress, payload: posison);
  }
}
