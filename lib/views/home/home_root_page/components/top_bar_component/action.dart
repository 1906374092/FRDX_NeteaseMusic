import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

enum TopBarAction { action, init, changeProgress, microPhoneTap }

class TopBarActionCreator {
  static Action onAction() {
    return const Action(TopBarAction.action);
  }

  static Action onInit(AnimationController controller) {
    return Action(TopBarAction.init, payload: controller);
  }

  static Action onChangeProgress(double posison) {
    return Action(TopBarAction.changeProgress, payload: posison);
  }

  static Action onMicroPhoneTap() {
    return const Action(TopBarAction.microPhoneTap);
  }
}
