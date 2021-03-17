import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_indicator_bar_component/action.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/action.dart';
import 'action.dart';
import 'state.dart';

Effect<CommentBottombarState> buildEffect() {
  return combineEffects(<Object, Effect<CommentBottombarState>>{
    CommentBottombarAction.action: _onAction,
    CommentBottombarAction.commitComment: _onCommitComment
  });
}

void _onAction(Action action, Context<CommentBottombarState> ctx) {}
void _onCommitComment(Action action, Context<CommentBottombarState> ctx) async {
  if (ctx.state.controller.text == null || ctx.state.controller.text == "") {
    PageUtil.showToast("评论不能为空");
    return;
  }
  Map data = await API.comment.commentOperationRequest(
      t: 1, type: 0, id: ctx.state.song.id, content: ctx.state.controller.text);
  try {
    Comment comment = Comment.fromJson(data["comment"]);
    ctx.dispatch(CommentListviewActionCreator.onAddItem(comment));
    FocusScope.of(ctx.context).requestFocus(FocusNode());
    ctx.state.controller.text = "";
    ctx.dispatch(CommentListviewActionCreator.onChangeSort(3));
    ctx.dispatch(CommentIndicatorBarActionCreator.onUpdateActiveIndex(2));
  } catch (e) {
    PageUtil.showToast("评论发送失败");
  }
}
