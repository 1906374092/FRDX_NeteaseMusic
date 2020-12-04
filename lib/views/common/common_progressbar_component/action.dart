import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_seekbar/seekbar/progress_value.dart';

enum CommonProgressbarAction { update, onValueChanged, onTapStart, onTapEnd }

class CommonProgressbarActionCreator {
  static Action onUpdate() {
    return const Action(CommonProgressbarAction.update);
  }

  static onValueChanged(ProgressValue value) {
    return Action(CommonProgressbarAction.onValueChanged, payload: value);
  }

  static onTapStartAction() {
    return const Action(CommonProgressbarAction.onTapStart);
  }

  static onTapEnd() {
    return const Action(CommonProgressbarAction.onTapEnd);
  }
}
