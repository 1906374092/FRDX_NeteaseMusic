import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WebviewState> buildEffect() {
  return combineEffects(<Object, Effect<WebviewState>>{
    WebviewAction.action: _onAction,
    WebviewAction.getTitle: _onGetTitle
  });
}

void _onAction(Action action, Context<WebviewState> ctx) {}
void _onGetTitle(Action action, Context<WebviewState> ctx) {
  ctx.state.controller.evaluateJavascript("document.title").then((value) {
    ctx.dispatch(WebviewActionCreator.onSetTitle(value));
  });
}
