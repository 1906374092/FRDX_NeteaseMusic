import 'package:fish_redux/fish_redux.dart';

enum GlobalPlayerLyricsAction {
  update,
  hide,
  updateVolumeValue,
  updateLyricsActiveLine,
  scrollAnimation,
  seekLyricLine,
  showLyricLine,
}

class GlobalPlayerLyricsActionCreator {
  static Action onUpdate() {
    return const Action(GlobalPlayerLyricsAction.update);
  }

  static Action onHide() {
    return const Action(GlobalPlayerLyricsAction.hide);
  }

  static Action onUpdateVolumeValue(double value) {
    return Action(GlobalPlayerLyricsAction.updateVolumeValue, payload: value);
  }

  static Action onUpdateLyricsActiveLine(int activeLine) {
    return Action(GlobalPlayerLyricsAction.updateLyricsActiveLine,
        payload: activeLine);
  }

  static Action onScrollAnimation(int activeLine) {
    return Action(GlobalPlayerLyricsAction.scrollAnimation,
        payload: activeLine);
  }

  static Action onSeekLyricLine() {
    return const Action(GlobalPlayerLyricsAction.seekLyricLine);
  }

  static Action onShowLyricLine(bool show) {
    return Action(GlobalPlayerLyricsAction.showLyricLine, payload: show);
  }
}
