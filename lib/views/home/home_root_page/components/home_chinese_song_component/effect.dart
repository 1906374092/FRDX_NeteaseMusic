import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeChineseSongState> buildEffect() {
  return combineEffects(<Object, Effect<HomeChineseSongState>>{
    HomeChineseSongAction.action: _onAction,
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _onAction(Action action, Context<HomeChineseSongState> ctx) {}
void _init(Action action, Context<HomeChineseSongState> ctx) {}
void _dispose(Action action, Context<HomeChineseSongState> ctx) {
  ctx.state.controller.dispose();
}
