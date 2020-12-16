import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/views/common/segment.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_indicator_bar_component/action.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/action.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/keys.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalCommentState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalCommentState>>{
    GlobalCommentAction.action: _onAction,
    Lifecycle.initState: _onInit,
    GlobalCommentAction.hideKeyboard: _onHideKeyboard
  });
}

void _onAction(Action action, Context<GlobalCommentState> ctx) {}
void _onInit(Action action, Context<GlobalCommentState> ctx) {
  Widget bar = ctx.buildComponent(GlobalCommentComponentKeys.Indicator_Bar_Key);
  ctx.dispatch(GlobalCommentActionCreator.onGetIndicatorBar(bar));
  ctx.dispatch(CommentListviewActionCreator.onGetIndicatorBar(bar));
}

void _onHideKeyboard(Action action, Context<GlobalCommentState> ctx) {
  FocusScope.of(ctx.context).requestFocus(FocusNode());
}
