import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/router/router.dart';
import 'package:zmusic_flutter/views/global_comment_page/state.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalPlayerButtonsbarState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalPlayerButtonsbarState>>{
    GlobalPlayerButtonsbarAction.action: _onAction,
    GlobalPlayerButtonsbarAction.tapComment: _onTapComment
  });
}

void _onAction(Action action, Context<GlobalPlayerButtonsbarState> ctx) {}
void _onTapComment(Action action, Context<GlobalPlayerButtonsbarState> ctx) {
  ApplicationManager.sharedInstance().router.navigateTo(
      ctx.context, XCAppRouter.globalComment,
      routeSettings: RouteSettings(arguments: {"type": CommentType.song}));
}
