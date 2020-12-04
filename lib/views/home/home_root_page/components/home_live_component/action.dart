import 'package:fish_redux/fish_redux.dart';

enum HomeLiveAction { updateData, updateOffset }

class HomeLiveActionCreator {
  static Action onUpdateData() {
    return const Action(HomeLiveAction.updateData);
  }

  static Action onUpdateOffset(double offset) {
    return Action(HomeLiveAction.updateOffset, payload: offset);
  }
}
