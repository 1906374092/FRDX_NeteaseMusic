import 'package:fish_redux/fish_redux.dart';

enum GlobalPlayerBackgroundAction { updateCover }

class GlobalPlayerBackgroundActionCreator {
  static Action onUpdateCover(String coverUrl) {
    return Action(GlobalPlayerBackgroundAction.updateCover, payload: coverUrl);
  }
}
