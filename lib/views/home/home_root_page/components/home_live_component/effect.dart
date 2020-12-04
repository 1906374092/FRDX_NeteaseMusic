import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeLiveState> buildEffect() {
  return combineEffects(<Object, Effect<HomeLiveState>>{
    HomeLiveAction.updateData: _onUpdateData,
    Lifecycle.initState: _onInit
  });
}

void _onUpdateData(Action action, Context<HomeLiveState> ctx) {}
void _onInit(Action action, Context<HomeLiveState> ctx) {
  ctx.state.controller.addListener(() async {
    double contentWidth =
        (ctx.state.block.creatives.length * 60 + 10 + 15).toDouble();
    if (ctx.state.controller.offset > contentWidth) {
      double offset = ctx.state.controller.offset - contentWidth - 40;
      ctx.dispatch(HomeLiveActionCreator.onUpdateOffset(offset));
      if (offset > -6 && offset < -5) {
        HapticFeedback.lightImpact();
      }
    } else {
      ctx.dispatch(HomeLiveActionCreator.onUpdateOffset(-50));
    }
  });
}
