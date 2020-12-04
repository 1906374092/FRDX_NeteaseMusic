import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/models/banner_item.dart';
import 'package:zmusic_flutter/router/router.dart';
import 'action.dart';
import 'state.dart';

Effect<SwiperState> buildEffect() {
  return combineEffects(<Object, Effect<SwiperState>>{
    SwiperAction.action: _onAction,
    Lifecycle.initState: _onInit,
    SwiperAction.itemTap: _onItemTap
  });
}

void _onAction(Action action, Context<SwiperState> ctx) {}
void _onInit(Action action, Context<SwiperState> ctx) {
  print(ctx.state.deviceInfo);
  // ctx.dispatch(SwiperActionCreator.onInit());
}

void _onItemTap(Action action, Context<SwiperState> ctx) {
  Banner_item item = action.payload;
  Navigator.of(ctx.context)
      .pushNamed(XCAppRouter.detail, arguments: {"url": item.url});
}
