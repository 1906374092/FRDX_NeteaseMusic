import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

enum MiniSongListAction {
  getData,
  playAction,
  updatePlayingStatus,
  jumpToPlayer
}

class MiniSongListActionCreator {
  static Action onGetData() {
    return const Action(MiniSongListAction.getData);
  }

  static Action onPlayAction(Map data) {
    return Action(MiniSongListAction.playAction, payload: data);
  }

  static Action onUpdatePlayingStatus(String songId) {
    return Action(MiniSongListAction.updatePlayingStatus, payload: songId);
  }

  static Action onJumpToPlayer(Resource resource) {
    return Action(MiniSongListAction.jumpToPlayer, payload: resource);
  }
}
