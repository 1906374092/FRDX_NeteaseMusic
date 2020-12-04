import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/banners.dart';
import 'package:zmusic_flutter/models/index.dart';

enum HomeRootAction {
  action,
  updateDaytimeData,
  updateMusicCalendar,
  updateHomePlaylist,
  updateHomeChineseSong,
  updateDragonBall,
  updateBanner,
  updateCountrySelect,
  updateLive,
  refreshAction
}

class HomeRootActionCreator {
  static Action onAction() {
    return const Action(HomeRootAction.action);
  }

  static Action onUpdateDayTimeData(HomeBlock data) {
    return Action(HomeRootAction.updateDaytimeData, payload: data);
  }

  static Action onUpdateMusicCalendar(CalendarResponse response) {
    return Action(HomeRootAction.updateMusicCalendar, payload: response);
  }

  static Action onUpdateHomePlaylistAction(HomeBlock data) {
    return Action(HomeRootAction.updateHomePlaylist, payload: data);
  }

  static Action onUpdateHomeChineseSong(HomeBlock data) {
    return Action(HomeRootAction.updateHomeChineseSong, payload: data);
  }

  static Action onUpdateDragonBall(List<DragonBall> data) {
    return Action(HomeRootAction.updateDragonBall, payload: data);
  }

  static Action onUpdateBanner(Banners data) {
    return Action(HomeRootAction.updateBanner, payload: data);
  }

  static Action onUpdateCountrySelect(HomeBlock data) {
    return Action(HomeRootAction.updateCountrySelect, payload: data);
  }

  static Action onUpdateLive(HomeBlock data) {
    return Action(HomeRootAction.updateLive, payload: data);
  }

  static Action onRefreshAction() {
    return const Action(HomeRootAction.refreshAction);
  }
}
