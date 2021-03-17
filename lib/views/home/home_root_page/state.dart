import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/common/swiper_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/country_select_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/dragonball_component_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_live_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_music_calendar_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_play_list_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/top_bar_component/state.dart';

class HomeRootState implements Cloneable<HomeRootState> {
  TopBarState topBarState;
  DeviceInfo deviceInfo;
  SwiperState swiperState;
  DragonballComponentState dragonballState;
  HomePlayListState homePlayListState;
  HomeChineseSongState homeChineseSongState;
  HomeMusicCalendarState homeMusicCalendarState;
  HomePlayListState dayTimePlayListState;
  CountrySelectState countrySelectState;
  HomeLiveState homeLiveState;

  RefreshController refreshController;

  @override
  HomeRootState clone() {
    return HomeRootState()
      ..topBarState = topBarState
      ..deviceInfo = deviceInfo
      ..swiperState = swiperState
      ..dragonballState = dragonballState
      ..homePlayListState = homePlayListState
      ..homeChineseSongState = homeChineseSongState
      ..homeMusicCalendarState = homeMusicCalendarState
      ..dayTimePlayListState = dayTimePlayListState
      ..countrySelectState = countrySelectState
      ..homeLiveState = homeLiveState
      ..refreshController = refreshController;
  }
}

HomeRootState initState(Map<String, dynamic> args) {
  DeviceInfo deviceInfo = ApplicationManager.sharedInstance().deviceInfo;
  return HomeRootState()
    ..topBarState = TopBarState()
    ..deviceInfo = deviceInfo
    ..swiperState = SwiperState()
    ..dragonballState = DragonballComponentState()
    ..homePlayListState = HomePlayListState()
    ..homeChineseSongState = HomeChineseSongState()
    ..homeMusicCalendarState = HomeMusicCalendarState()
    ..dayTimePlayListState = HomePlayListState()
    ..countrySelectState = CountrySelectState()
    ..homeLiveState = HomeLiveState()
    ..refreshController = RefreshController();
}

///导航栏连接器
class TopBarComponentConnector extends ConnOp<HomeRootState, TopBarState> {
  @override
  TopBarState get(HomeRootState state) {
    return state.topBarState;
  }

  @override
  void set(HomeRootState state, TopBarState subState) {
    state.topBarState = subState;
  }
}

///banner 连接器
class SwiperComponentConnector extends ConnOp<HomeRootState, SwiperState> {
  @override
  SwiperState get(HomeRootState state) {
    return state.swiperState;
  }

  @override
  void set(HomeRootState state, SwiperState subState) {
    state.swiperState = subState;
  }
}

///圆形入口按钮组件连接器
class DragonballListComponentConnector
    extends ConnOp<HomeRootState, DragonballComponentState> {
  @override
  DragonballComponentState get(HomeRootState state) {
    return state.dragonballState;
  }

  @override
  void set(HomeRootState state, DragonballComponentState subState) {
    state.dragonballState = subState;
  }
}

///歌单推荐组件连接器
class HomePlayListComponentConnector
    extends ConnOp<HomeRootState, HomePlayListState> {
  @override
  HomePlayListState get(HomeRootState state) {
    return state.homePlayListState;
  }

  @override
  void set(HomeRootState state, HomePlayListState subState) {
    state.homePlayListState = subState;
  }
}

///华语推荐组件连接器
class HomeChineseSongComponentConnector
    extends ConnOp<HomeRootState, HomeChineseSongState> {
  @override
  HomeChineseSongState get(HomeRootState state) {
    return state.homeChineseSongState;
  }

  @override
  void set(HomeRootState state, HomeChineseSongState subState) {
    state.homeChineseSongState = subState;
  }
}

///音乐日历组件连接器
class HomeMusicCalendarComponentConnector
    extends ConnOp<HomeRootState, HomeMusicCalendarState> {
  @override
  HomeMusicCalendarState get(HomeRootState state) {
    return state.homeMusicCalendarState;
  }

  @override
  void set(HomeRootState state, HomeMusicCalendarState subState) {
    state.homeMusicCalendarState = subState;
  }
}

///分时段推荐连接器
class HomeDaytimeComponentConnector
    extends ConnOp<HomeRootState, HomePlayListState> {
  @override
  HomePlayListState get(HomeRootState state) {
    return state.dayTimePlayListState;
  }

  @override
  void set(HomeRootState state, HomePlayListState subState) {
    state.dayTimePlayListState = subState;
  }
}

///云村精选连接器
class CountrySelectComponentConnector
    extends ConnOp<HomeRootState, CountrySelectState> {
  @override
  CountrySelectState get(HomeRootState state) {
    return state.countrySelectState;
  }

  @override
  void set(HomeRootState state, CountrySelectState subState) {
    state.countrySelectState = subState;
  }
}

///直播推荐连接器
class HomeLiveComponentConnector extends ConnOp<HomeRootState, HomeLiveState> {
  @override
  HomeLiveState get(HomeRootState state) {
    return state.homeLiveState;
  }

  @override
  void set(HomeRootState state, HomeLiveState subState) {
    state.homeLiveState = subState;
  }
}
