import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/router/router.dart';
import 'package:zmusic_flutter/views/common/mini_player_component/state.dart';
import 'action.dart';
import 'state.dart';

Effect<TopBarState> buildEffect() {
  return combineEffects(<Object, Effect<TopBarState>>{
    TopBarAction.action: _onAction,
    Lifecycle.initState: _init,
    TopBarAction.microPhoneTap: _onMicroPhoneTap
  });
}

void _onAction(Action action, Context<TopBarState> ctx) {}
void _init(Action action, Context<TopBarState> ctx) {
  // // 初始化miniplayer state
  // ctx.state.miniPlayerState = MiniPlayerState();
  // // 初始化封面旋转动画
  // final TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  // AnimationController controller = AnimationController(
  //     duration: Duration(seconds: 7), vsync: tickerProvider);
  // controller.addStatusListener((status) {
  //   if (status == AnimationStatus.completed) {
  //     controller.reset();
  //     controller.forward();
  //   }
  // });
  // controller.addListener(() {
  //   ctx.state.musicPosition = 0.001 + ctx.state.musicPosition;
  //   ctx.dispatch(TopBarActionCreator.onChangeProgress(ctx.state.musicPosition));
  // });
  // controller.forward();

  // ctx.dispatch(TopBarActionCreator.onInit(controller));
}

void _onMicroPhoneTap(Action action, Context<TopBarState> ctx) {
  Navigator.of(ctx.context).pushNamed(XCAppRouter.login);
}
