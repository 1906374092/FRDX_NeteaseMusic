import 'package:fish_redux/fish_redux.dart';

enum GlobalPlayerButtonsbarAction { action, tapComment }

class GlobalPlayerButtonsbarActionCreator {
  static Action onAction() {
    return const Action(GlobalPlayerButtonsbarAction.action);
  }

  static Action onTapComment() {
    return const Action(GlobalPlayerButtonsbarAction.tapComment);
  }
}
