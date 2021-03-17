import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/config/enums.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/banner_item.dart';
import 'package:zmusic_flutter/models/banners.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/router/router.dart';
import 'package:zmusic_flutter/views/common/swiper_component/action.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/country_select_component/action.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/dragonball_component_component/action.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/action.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_live_component/action.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_music_calendar_component/action.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_play_list_component/action.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeRootState> buildEffect() {
  return combineEffects(<Object, Effect<HomeRootState>>{
    HomeRootAction.action: _onAction,
    Lifecycle.initState: _init,
    SwiperAction.itemTap: _onItemTap,
    HomeRootAction.refreshAction: _onRefreshAction
  });
}

void _onAction(Action action, Context<HomeRootState> ctx) {}
void _init(Action action, Context<HomeRootState> ctx) {
  getBannerData(ctx);
  getDragonball(ctx);
  getAllData(ctx);
  getHomeMusicCalendar(ctx);
}

///获取banner数据
Future getBannerData(Context<HomeRootState> ctx) async {
  var data = await API.home.getBannerRequest(2);
  if (data == null) {
    ApplicationManager.logger.i("banner数据获取失败");
    return;
  }
  Banners banners = Banners.fromJson(data);
  ctx.dispatch(HomeRootActionCreator.onUpdateBanner(banners));
  ctx.dispatch(SwiperActionCreator.onGetBanner(banners));
}

///圆形图标
Future getDragonball(Context<HomeRootState> ctx) async {
  Map data = await API.home.getDragonballRequest();
  if (data == null) {
    ApplicationManager.logger.i("dragonball数据获取失败");
    return;
  }
  Home_ball ballData = Home_ball.fromJson(data);
  ctx.dispatch(HomeRootActionCreator.onUpdateDragonBall(ballData.data));
  ctx.dispatch(DragonballComponentActionCreator.onUpdateItem());
}

///banner点击事件
void _onItemTap(Action action, Context<HomeRootState> ctx) {
  Banner_item item = action.payload;
  Navigator.of(ctx.context)
      .pushNamed(XCAppRouter.detail, arguments: {"url": item.url});
}

///获取首页全部数据
Future getAllData(Context<HomeRootState> ctx) async {
  Map data = await API.home.getHomeMainDataRequest(false);

  if (data == null) {
    ApplicationManager.logger.i("首页剩余数据获取失败");
    return;
  }
  HomeMainResponse response = HomeMainResponse.fromJson(data);

  for (HomeBlock item in response.data.blocks) {
    if (item.blockCode == BlockCodes.HOMEPAGE_BLOCK_PLAYLIST_RCMD) {
      //刷新推荐歌单数据
      ctx.dispatch(HomeRootActionCreator.onUpdateHomePlaylistAction(item));
    } else if (item.blockCode == BlockCodes.HOMEPAGE_BLOCK_STYLE_RCMD) {
      //刷新华语推荐数据
      ctx.dispatch(HomeRootActionCreator.onUpdateHomeChineseSong(item));
      ctx.dispatch(HomeChineseSongActionCreator.onGetData());
    } else if (item.blockCode == BlockCodes.HOMEPAGE_BLOCK_OFFICIAL_PLAYLIST) {
      //刷新当日分时段推荐歌单
      ctx.dispatch(HomeRootActionCreator.onUpdateDayTimeData(item));
      ctx.dispatch(HomePlayListActionCreator.onGetAllData());
    } else if (item.blockCode == BlockCodes.HOMEPAGE_BLOCK_MLOG) {
      //刷新云村推荐数据
      ctx.dispatch(HomeRootActionCreator.onUpdateCountrySelect(item));
      ctx.dispatch(CountrySelectActionCreator.upadteData());
    } else if (item.blockCode == BlockCodes.HOMEPAGE_BLOCK_LISTEN_LIVE) {
      //刷新直播推荐数据
      ctx.dispatch(HomeRootActionCreator.onUpdateLive(item));
      ctx.dispatch(HomeLiveActionCreator.onUpdateData());
    }
  }
}

///获取首页音乐日历
Future getHomeMusicCalendar(Context<HomeRootState> ctx) async {
  Map data = await API.home.getMusicCalendar();
  if (data == null) {
    ApplicationManager.logger.i("首页音乐日历数据获取失败");
    return;
  }
  CalendarResponse response = CalendarResponse.fromJson(data);
  ctx.dispatch(HomeRootActionCreator.onUpdateMusicCalendar(response));
  ctx.dispatch(HomeMusicCalendarActionCreator.onGetData());
}

///下拉刷新动作
void _onRefreshAction(Action action, Context<HomeRootState> ctx) async {
  await getBannerData(ctx);
  await getDragonball(ctx);
  await getAllData(ctx);
  await getHomeMusicCalendar(ctx);
  ctx.state.refreshController.refreshCompleted();
}
