import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zmusic_flutter/views/home/home_root_page/action.dart';
import 'action.dart';
import 'state.dart';

Effect<HomePlayListState> buildEffect() {
  return combineEffects(<Object, Effect<HomePlayListState>>{
    HomePlayListAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<HomePlayListState> ctx) {}
void _onInit(Action action, Context<HomePlayListState> ctx) {
  ctx.state.controller.addListener(() async {
    double contentWidth =
        (ctx.state.homeBlock.creatives.length * 60 + 10 + 15).toDouble();
    if (ctx.state.controller.offset > contentWidth) {
      double offset = ctx.state.controller.offset - contentWidth - 40;
      ctx.dispatch(HomePlayListActionCreator.onUpdateOffset(offset));
      if (offset > -6 && offset < -5) {
        HapticFeedback.lightImpact();
      }
    } else {
      ctx.dispatch(HomePlayListActionCreator.onUpdateOffset(-50));
    }
  });
}
