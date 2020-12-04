import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<CommonProgressbarState> buildEffect() {
  return combineEffects(<Object, Effect<CommonProgressbarState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDisPose,
  });
}

void _onInit(Action action, Context<CommonProgressbarState> ctx) {
  TickerProvider provider = ctx.stfState as TickerProvider;
  ctx.state.barSizeController = AnimationController(
      duration: Duration(milliseconds: 100), vsync: provider);
}

void _onDisPose(Action action, Context<CommonProgressbarState> ctx) {
  ctx.state.barSizeController.dispose();
}
