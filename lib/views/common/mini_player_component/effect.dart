import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<MiniPlayerState> buildEffect() {
  return combineEffects(<Object, Effect<MiniPlayerState>>{
    MiniPlayerAction.action: _onAction,
    Lifecycle.initState: _init
  });
}

void _onAction(Action action, Context<MiniPlayerState> ctx) {}
void _init(Action action, Context<MiniPlayerState> ctx) {
  //初始化封面旋转动画
  final TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  AnimationController controller = AnimationController(
      duration: Duration(seconds: 7), vsync: tickerProvider);
  controller.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      controller.reset();
      controller.forward();
    }
  });
  controller.addListener(() {
    ctx.state.musicPosition = 0.001 + ctx.state.musicPosition;
    ctx.dispatch(
        MiniPlayerActionCreator.onChangeProgress(ctx.state.musicPosition));
  });
  controller.forward();

  ctx.dispatch(MiniPlayerActionCreator.onInit(controller));
}
