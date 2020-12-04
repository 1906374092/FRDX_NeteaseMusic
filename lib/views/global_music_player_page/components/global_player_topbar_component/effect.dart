import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<GlobalPlayerTopbarState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalPlayerTopbarState>>{
    GlobalPlayerTopbarAction.popPage: _onPopPage,
  });
}

void _onPopPage(Action action, Context<GlobalPlayerTopbarState> ctx) {
  Navigator.of(ctx.context).pop();
}
