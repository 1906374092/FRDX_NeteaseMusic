import 'package:fish_redux/fish_redux.dart';

enum GlobalMusicPlayerAction {
  action,
  showLyrics,
  setLyricsData,
}

class GlobalMusicPlayerActionCreator {
  static Action onAction() {
    return const Action(GlobalMusicPlayerAction.action);
  }

  static Action onShowLyrics(bool showLyrics) {
    return Action(GlobalMusicPlayerAction.showLyrics, payload: showLyrics);
  }

  static Action onSetLyricsData(List<Map> lyrics) {
    return Action(GlobalMusicPlayerAction.setLyricsData, payload: lyrics);
  }
}
