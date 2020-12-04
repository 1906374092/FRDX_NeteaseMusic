import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

enum LoginAction { action, configAnimation, hideKeyboard, loginTap }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onConfigAnimation(AnimationController controller) {
    return Action(LoginAction.configAnimation, payload: controller);
  }

  static Action onHidekeyboard() {
    return const Action(LoginAction.hideKeyboard);
  }

  static Action onLoginTap() {
    return const Action(LoginAction.loginTap);
  }
}
