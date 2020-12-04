import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class LoginState implements Cloneable<LoginState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  AnimationController controller;
  FocusNode phoneNode;
  FocusNode passwordNode;
  TextEditingController phoneController;
  TextEditingController passwordController;

  @override
  LoginState clone() {
    return LoginState()
      ..controller = controller
      ..phoneNode = phoneNode
      ..passwordNode = passwordNode
      ..phoneController = phoneController
      ..passwordController = passwordController;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState()
    ..controller = null
    ..phoneNode = FocusNode()
    ..passwordNode = FocusNode()
    ..phoneController = TextEditingController()
    ..passwordController = TextEditingController();
}
