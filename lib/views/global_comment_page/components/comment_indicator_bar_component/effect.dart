import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/common/segment.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/action.dart';
import 'action.dart';
import 'state.dart';

Effect<CommentIndicatorBarState> buildEffect() {
  return combineEffects(<Object, Effect<CommentIndicatorBarState>>{
    CommentIndicatorBarAction.action: _onAction,
    Lifecycle.initState: _onInit
  });
}

void _onAction(Action action, Context<CommentIndicatorBarState> ctx) {}
void _onInit(Action action, Context<CommentIndicatorBarState> ctx) {}
