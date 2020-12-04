import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<HomeMusicCalendarState> buildEffect() {
  return combineEffects(<Object, Effect<HomeMusicCalendarState>>{
    Lifecycle.initState: _onInit,
  });
}

void _onInit(Action action, Context<HomeMusicCalendarState> ctx) {
  final TickerProvider provider = ctx.stfState as TickerProvider;
  final AnimationController controller = AnimationController(
      duration: Duration(milliseconds: 800), vsync: provider);
  Animation animation = Tween<double>(begin: 0.8, end: 1)
      .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  controller.forward();
  ctx.dispatch(HomeMusicCalendarActionCreator.onSetAnimation(animation));
  controller.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(Duration(seconds: 5), () {
        controller.reset();
        controller.forward();
        if (ctx.state.indexControl >=
            ctx.state.response.data.calendarEvents.length - 1) {
          ctx.dispatch(HomeMusicCalendarActionCreator.changeIndex(0));
        } else {
          ctx.dispatch(HomeMusicCalendarActionCreator.changeIndex(
              ctx.state.indexControl + 1));
        }
      });
    }
  });
  // Timer.periodic(Duration(seconds: 5), (timer) {
  //   controller.reset();
  //   controller.forward();
  //   if (ctx.state.indexControl >=
  //       ctx.state.response.data.calendarEvents.length - 1) {
  //     ctx.dispatch(HomeMusicCalendarActionCreator.changeIndex(0));
  //   } else {
  //     ctx.dispatch(HomeMusicCalendarActionCreator.changeIndex(
  //         ctx.state.indexControl + 1));
  //   }
  // });
}
