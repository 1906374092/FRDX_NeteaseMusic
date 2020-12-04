import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/models/index.dart';

enum GlobalPlayerControlpadAction {
  action,
  play,
  pause,
  updatePlayingStatus,
  updateProgressData,
  showLocalPlaylist,
  setPlayListOptionIcon,
  changePlayListOption,
  playPrevious,
  playNext,
  handleItemChange
}

class GlobalPlayerControlpadActionCreator {
  static Action onAction() {
    return const Action(GlobalPlayerControlpadAction.action);
  }

  static Action onPlay() {
    return Action(GlobalPlayerControlpadAction.play);
  }

  static Action onPause() {
    return Action(GlobalPlayerControlpadAction.pause);
  }

  static Action onUpdatePlayingStatus(bool isPlaying) {
    return Action(GlobalPlayerControlpadAction.updatePlayingStatus,
        payload: isPlaying);
  }

  static Action onUpdateProgressData(Map durationInfo) {
    return Action(GlobalPlayerControlpadAction.updateProgressData,
        payload: durationInfo);
  }

  static Action onShowLocalPlaylist() {
    return const Action(GlobalPlayerControlpadAction.showLocalPlaylist);
  }

  static Action onSetPlayListOptionIcon(IconData iconData) {
    return Action(GlobalPlayerControlpadAction.setPlayListOptionIcon,
        payload: iconData);
  }

  static Action onChangePlayListOptionAction() {
    return const Action(GlobalPlayerControlpadAction.changePlayListOption);
  }

  static Action onPlayPrevious({bool animate = true}) {
    return Action(GlobalPlayerControlpadAction.playPrevious, payload: animate);
  }

  static Action onPlayNext({bool animate = true}) {
    return Action(GlobalPlayerControlpadAction.playNext, payload: animate);
  }

  static Action onHandleItemTap(SongData song) {
    return Action(GlobalPlayerControlpadAction.handleItemChange, payload: song);
  }
}
