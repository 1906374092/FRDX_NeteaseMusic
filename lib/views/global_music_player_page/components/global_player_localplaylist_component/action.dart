import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';

enum GlobalPlayerLocalplaylistAction {
  action,
  setPlayOption,
  changePlayOption,
  close,
  setLocalPlayList,
  deleteItem,
  deleteAll,
  tapItem,
}

class GlobalPlayerLocalplaylistActionCreator {
  static Action onAction() {
    return const Action(GlobalPlayerLocalplaylistAction.action);
  }

  static Action onSetPlayOption(PlayListOption option) {
    return Action(GlobalPlayerLocalplaylistAction.setPlayOption,
        payload: option);
  }

  static Action onChangePlayOption() {
    return const Action(GlobalPlayerLocalplaylistAction.changePlayOption);
  }

  static Action onClose() {
    return const Action(GlobalPlayerLocalplaylistAction.close);
  }

  static Action onSetLocalPlayList(List<SongData> data) {
    return Action(GlobalPlayerLocalplaylistAction.setLocalPlayList,
        payload: data);
  }

  static Action onDeleteItem(SongData song) {
    return Action(GlobalPlayerLocalplaylistAction.deleteItem, payload: song);
  }

  static Action onDeleteAll() {
    return const Action(GlobalPlayerLocalplaylistAction.deleteAll);
  }

  static Action onTapItem(SongData item) {
    return Action(GlobalPlayerLocalplaylistAction.tapItem, payload: item);
  }
}
