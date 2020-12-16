import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_bottombar_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_indicator_bar_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_topbar_component/state.dart';

enum CommentType { song, playList }

class GlobalCommentState implements Cloneable<GlobalCommentState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  CommentType commentType;
  bool showIndicator;

  ScrollController scrollController;

  CommentTopbarState commentTopbarState;
  CommentBottombarState commentBottombarState;
  CommentListviewState commentListviewState;
  CommentIndicatorBarState commentIndicatorBarState;
  @override
  GlobalCommentState clone() {
    return GlobalCommentState()
      ..commentTopbarState = commentTopbarState
      ..commentType = commentType
      ..showIndicator = showIndicator
      ..commentBottombarState = commentBottombarState
      ..commentListviewState = commentListviewState
      ..scrollController = scrollController
      ..commentIndicatorBarState = commentIndicatorBarState;
  }
}

GlobalCommentState initState(Map<String, dynamic> args) {
  CommentType type = args["type"];
  return GlobalCommentState()
    ..commentTopbarState = CommentTopbarState()
    ..commentType = type
    ..showIndicator = false
    ..commentBottombarState = CommentBottombarState(
        song: ApplicationManager.sharedInstance().playerManager.sonngData)
    ..commentListviewState = CommentListviewState(type: type)
    ..scrollController = ScrollController()
    ..commentIndicatorBarState = CommentIndicatorBarState();
}

///导航栏连接器
class CommentTopbarConnector
    extends ConnOp<GlobalCommentState, CommentTopbarState> {
  @override
  void set(GlobalCommentState state, CommentTopbarState subState) {
    state.commentTopbarState = subState;
  }

  @override
  CommentTopbarState get(GlobalCommentState state) {
    return state.commentTopbarState;
  }
}

///底部输入框连接器
class CommentBottombarConnector
    extends ConnOp<GlobalCommentState, CommentBottombarState> {
  @override
  void set(GlobalCommentState state, CommentBottombarState subState) {
    state.commentBottombarState = subState;
  }

  @override
  CommentBottombarState get(GlobalCommentState state) {
    return state.commentBottombarState;
  }
}

///评论列表连接器
class CommentListviewConnector
    extends ConnOp<GlobalCommentState, CommentListviewState> {
  @override
  void set(GlobalCommentState state, CommentListviewState subState) {
    state.commentListviewState = subState;
  }

  @override
  CommentListviewState get(GlobalCommentState state) {
    return state.commentListviewState;
  }
}

///
///评论区头部连接器
class CommentViewIndicatorBarConnector
    extends ConnOp<GlobalCommentState, CommentIndicatorBarState> {
  @override
  void set(GlobalCommentState state, CommentIndicatorBarState subState) {
    state.commentIndicatorBarState = subState;
  }

  @override
  CommentIndicatorBarState get(GlobalCommentState state) {
    return state.commentIndicatorBarState;
  }
}
