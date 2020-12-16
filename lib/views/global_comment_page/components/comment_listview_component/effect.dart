import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/views/global_comment_page/action.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/commen_playlist_banner_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_indicator_bar_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/comment_list_item_component/action.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/comment_list_item_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_song_banner_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_topbar_component/action.dart';
import 'action.dart';
import 'state.dart';

Effect<CommentListviewState> buildEffect() {
  return combineEffects(<Object, Effect<CommentListviewState>>{
    Lifecycle.initState: _onInit,
    CommentListviewAction.changeSort: _getCommentListData,
    CommentListviewAction.loadData: _onLoadData,
  });
}

void _onInit(Action action, Context<CommentListviewState> ctx) {
  ctx.state.commentSongBannerState = CommentSongBannerState();
  ctx.state.commenPlaylistBannerState = CommenPlaylistBannerState();
  ctx.state.commentIndicatorBarState = CommentIndicatorBarState();
  _getCommentListData(action, ctx);
  _controlScrollBehavior(ctx);
}

void _controlScrollBehavior(Context<CommentListviewState> ctx) {
  ctx.state.controller.addListener(() {
    if (ctx.state.controller.offset > 138) {
      ctx.dispatch(GlobalCommentActionCreator.onindicatorShow(true));
    } else {
      ctx.dispatch(GlobalCommentActionCreator.onindicatorShow(false));
    }
  });
}

void _getCommentListData(
    Action action, Context<CommentListviewState> ctx) async {
  int sortType = action.payload;
  Map data = await API.comment.getCommentList(
      id: ctx.state.songData.id,
      type: 0,
      pageNo: 1,
      pageSize: 20,
      sortType: sortType ?? 1);
  try {
    CommentResponse response = CommentResponse.fromJson(data);
    if (ctx.state.items != null) {
      if (ctx.state.items.length > 20) {
        ctx.state.items.removeRange(20, ctx.state.items.length);
      }
      for (var i = 0; i < ctx.state.items.length; i++) {
        CommentListItemState state = ctx.state.items[i];
        Comment currentModel = response.data.comments[i];
        state.resetModel(
            currentModel, currentModel.liked, currentModel.likedCount);
      }
      ctx.dispatch(CommentListItemActionCreator.onUpdateItem());
    } else {
      List<CommentListItemState> result =
          List.generate(response.data.comments.length, (index) {
        return CommentListItemState(
            commentModel: response.data.comments[index],
            song: ctx.state.songData);
      });
      ctx.dispatch(CommentListviewActionCreator.onUpdateData(result));
    }

    ctx.dispatch(CommentTopbarActionCreator.onUpdateTotal(
        response.data.totalCount.toString()));
  } catch (e) {
    print(e);
  }
}

void _onLoadData(Action action, Context<CommentListviewState> ctx) {}
