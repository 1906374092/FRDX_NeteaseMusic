import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zmusic_flutter/views/common/keys.dart';
import 'package:zmusic_flutter/views/common/refresh_component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/action.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/keys.dart';
import 'state.dart';

Widget buildView(
    HomeRootState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth,
    height: state.deviceInfo.screenHeight,
    child: Stack(
      children: [
        Positioned(
          top: state.deviceInfo.naviBarHeight,
          left: 0,
          right: 0,
          bottom: state.deviceInfo.bottomBarHeight,
          child: SmartRefresher(
            controller: state.refreshController,
            footer: RefreshComponent.getFooter(),
            header: RefreshComponent.getHeader(),
            onRefresh: () {
              dispatch(HomeRootActionCreator.onRefreshAction());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  viewService
                      .buildComponent(CommonComponentKeys.Swiper_Component_Key),
                  viewService.buildComponent(HomeRootKeys.Dragonball_List_key),
                  viewService.buildComponent(HomeRootKeys.Home_Play_List_Key),
                  viewService
                      .buildComponent(HomeRootKeys.Home_Chinese_Song_Part_Key),
                  viewService
                      .buildComponent(HomeRootKeys.Home_Music_Calendar_Key),
                  Container(
                    child: viewService
                        .buildComponent(HomeRootKeys.Home_Daytime_PlayList_Key),
                  ),
                  Container(
                    child: viewService
                        .buildComponent(HomeRootKeys.Home_Country_Select_Key),
                  ),
                  Container(
                    child:
                        viewService.buildComponent(HomeRootKeys.Home_Live_Key),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: viewService.buildComponent(HomeRootKeys.Top_Bar_Key)),
      ],
    ),
  );
}
