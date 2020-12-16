import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<CommentTopbarState> buildEffect() {
  return combineEffects(<Object, Effect<CommentTopbarState>>{
    CommentTopbarAction.action: _onAction,
    CommentTopbarAction.backAction: _onBackAction
  });
}

void _onAction(Action action, Context<CommentTopbarState> ctx) {}
void _onBackAction(Action action, Context<CommentTopbarState> ctx) {
  Navigator.of(ctx.context).pop();
}
