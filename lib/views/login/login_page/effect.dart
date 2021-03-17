import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/manager/local_storage.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/router/fade.dart';
import 'package:zmusic_flutter/utils/validator.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';
import 'package:zmusic_flutter/views/tab/tab.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    Lifecycle.initState: _onInit,
    LoginAction.hideKeyboard: _onHideKeyboard,
    LoginAction.loginTap: _onLoginTap
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}
void _onInit(Action action, Context<LoginState> ctx) {
  final TickerProvider provider = ctx.stfState as TickerProvider;
  AnimationController controller =
      AnimationController(duration: Duration(seconds: 6), vsync: provider);
  ctx.dispatch(LoginActionCreator.onConfigAnimation(controller));
}

void _onHideKeyboard(Action action, Context<LoginState> ctx) {
  FocusScope.of(ctx.context).requestFocus(FocusNode());
}

void _onLoginTap(Action action, Context<LoginState> ctx) async {
  String phone = ctx.state.phoneController.text;
  String password = ctx.state.passwordController.text;
  if (phone == null || phone == "") {
    PageUtil.showToast("请输入手机号");
    return;
  }
  if (!Validator.checkPhone(phone)) {
    PageUtil.showToast("请输入正确格式的手机号");
    return;
  }
  if (password == null || password == "") {
    PageUtil.showToast("请输入密码");
    return;
  }
  PageUtil.showLoading(ctx.context);
  Map result = await API.login.loginRequest(phone, password);
  PageUtil.dismissLoading();
  if (result["code"] != 200) {
    PageUtil.showToast(result["msg"]);
    return;
  }
  StorageManager manager = await StorageManager.getInstance();
  manager.loginInfo = result;
  ApplicationManager.sharedInstance().loginInfo = Login_info.fromJson(result);
  Navigator.pushReplacement(ctx.context, FadeRoute(
    builder: (context) {
      return TabBarController();
    },
  ));
}
