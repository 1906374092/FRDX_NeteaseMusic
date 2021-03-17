import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<WebviewTopbarState> buildEffect() {
  return combineEffects(<Object, Effect<WebviewTopbarState>>{
    WebviewTopbarAction.action: _onAction,
    WebviewTopbarAction.popAction: _onPopAction
  });
}

void _onAction(Action action, Context<WebviewTopbarState> ctx) {}
void _onPopAction(Action action, Context<WebviewTopbarState> ctx) {
  Navigator.of(ctx.context).pop();
}
