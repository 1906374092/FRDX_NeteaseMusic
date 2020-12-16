import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/manager/local_storage.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_indicator_bar_component/action.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/action.dart';
import 'action.dart';
import 'state.dart';

Effect<CommentListItemState> buildEffect() {
  return combineEffects(<Object, Effect<CommentListItemState>>{
    CommentListItemAction.action: _onAction,
    CommentListItemAction.likeAction: _onLikeAction,
    Lifecycle.initState: _onInit,
    CommentListItemAction.showActionSheet: _onShowActionSheet
  });
}

void _onAction(Action action, Context<CommentListItemState> ctx) {}
void _onInit(Action action, Context<CommentListItemState> ctx) {
  ctx.state.liked = ctx.state.commentModel.liked;
  ctx.state.likedCount = ctx.state.commentModel.likedCount;
  TickerProvider provider = ctx.stfState as TickerProvider;
  ctx.state.likeController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: provider,
      lowerBound: 1.0,
      upperBound: 1.5);
  ctx.state.likeController.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      ctx.state.likeController.reverse();
    }
  });
}

void _onLikeAction(Action action, Context<CommentListItemState> ctx) async {
  bool currentLikeStatus = action.payload;
  HapticFeedback.lightImpact();
  if (currentLikeStatus == false) {
    ctx.state.likeController.forward();
    ctx.dispatch(CommentListItemActionCreator.onUpdateLikeStatus(
        true, ctx.state.commentModel.commentId));
    Map result = await API.comment.commentLikeRequest(
        cid: ctx.state.commentModel.commentId,
        t: 1,
        type: 0,
        id: ApplicationManager.sharedInstance().playerManager.sonngData.id);
    if (result == null) {
      PageUtil.showToast("点赞失败");
    }
  } else {
    ctx.dispatch(CommentListItemActionCreator.onUpdateLikeStatus(
        false, ctx.state.commentModel.commentId));
    Map result = await API.comment.commentLikeRequest(
        cid: ctx.state.commentModel.commentId,
        t: 0,
        type: 0,
        id: ApplicationManager.sharedInstance().playerManager.sonngData.id);
    if (result == null) {
      PageUtil.showToast("取消点赞失败");
    }
  }
}

void _onShowActionSheet(Action action, Context<CommentListItemState> ctx) {
  Login_info info = ApplicationManager.sharedInstance().loginInfo;
  showCupertinoModalPopup(
    context: ctx.context,
    builder: (context) {
      return CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                ctx.dispatch(
                    CommentListItemActionCreator.onLike(ctx.state.liked));
                Navigator.of(ctx.context).pop();
              },
              child: Text(ctx.state.liked ? "取消赞赏" : "赞赏评论")),
          CupertinoActionSheetAction(
            child: Text("分享评论"),
            onPressed: () {},
          ),
          CupertinoActionSheetAction(
            child: Text("复制评论"),
            onPressed: () {},
          ),
          info.profile.userId == ctx.state.commentModel.user.userId
              ? CupertinoActionSheetAction(
                  child: Text(
                    "删除评论",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    _deleteComment(action, ctx);
                    Navigator.of(ctx.context).pop();
                  },
                )
              : CupertinoActionSheetAction(
                  child: Text(
                    "举报评论",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {},
                )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text("取消"),
          onPressed: () {
            Navigator.of(ctx.context).pop();
          },
        ),
      );
    },
  );
}

void _deleteComment(Action action, Context<CommentListItemState> ctx) async {
  try {
    Map data = await API.comment.commentOperationRequest(
        t: 0,
        type: 0,
        id: ctx.state.song.id,
        commentId: ctx.state.commentModel.commentId);
    if (data == null) {
      PageUtil.showToast("评论删除失败");
      return;
    }
    ctx.dispatch(CommentListviewActionCreator.onChangeSort(3));
    ctx.dispatch(CommentIndicatorBarActionCreator.onUpdateActiveIndex(2));
  } catch (e) {
    print(e);
  }
}
