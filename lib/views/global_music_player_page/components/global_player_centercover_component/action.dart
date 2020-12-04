import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

enum GlobalPlayerCentercoverAction {
  action,
  updateCover,
  updateArmAngle,
  updatePlayingStatus,
  hide,
  updateLocalPlayList,
  musicSwitch,
  pause,
  play,
  swiperIndexChanged,
  setCouldSwipe
}
enum SwitchType {
  previous,
  next,
  any,
}

class GlobalPlayerCentercoverActionCreator {
  static Action onAction() {
    return const Action(GlobalPlayerCentercoverAction.action);
  }

  static Action onUpdateCover(String coverUrl) {
    return Action(GlobalPlayerCentercoverAction.updateCover, payload: coverUrl);
  }

  static Action onUpdateArmAngle(double angle) {
    return Action(GlobalPlayerCentercoverAction.updateArmAngle, payload: angle);
  }

  static Action onUpdatePlayingStatus(bool isPlaying) {
    return Action(GlobalPlayerCentercoverAction.updatePlayingStatus,
        payload: isPlaying);
  }

  static Action onHide() {
    return const Action(GlobalPlayerCentercoverAction.hide);
  }

  static Action onUpdateLocalPlayList(List<SongData> localPlayList) {
    return Action(GlobalPlayerCentercoverAction.updateLocalPlayList,
        payload: localPlayList);
  }

  static Action onMusicSwitch(SwitchType switchType, {int index}) {
    return Action(GlobalPlayerCentercoverAction.musicSwitch,
        payload: {"type": switchType, "index": index});
  }

  static Action onPause() {
    return const Action(GlobalPlayerCentercoverAction.pause);
  }

  static Action onPlay() {
    return const Action(GlobalPlayerCentercoverAction.play);
  }

  static Action onSwiperIndexChanged(int value) {
    return Action(GlobalPlayerCentercoverAction.swiperIndexChanged,
        payload: value);
  }

  static Action onSetCouldSwipe(bool couldSwipe) {
    return Action(GlobalPlayerCentercoverAction.setCouldSwipe,
        payload: couldSwipe);
  }
}
