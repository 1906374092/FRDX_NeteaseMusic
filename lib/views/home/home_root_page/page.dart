import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/common/common_button_component/component.dart';
import 'package:zmusic_flutter/views/common/keys.dart';
import 'package:zmusic_flutter/views/common/swiper_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/country_select_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/dragonball_component_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_live_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_music_calendar_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_play_list_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/top_bar_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/keys.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeRootPage extends Page<HomeRootState, Map<String, dynamic>> {
  HomeRootPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeRootState>(
              adapter: null,
              slots: <String, Dependent<HomeRootState>>{
                HomeRootKeys.Top_Bar_Key:
                    TopBarComponentConnector() + TopBarComponent(),
                CommonComponentKeys.Swiper_Component_Key:
                    SwiperComponentConnector() + SwiperComponent(),
                HomeRootKeys.Dragonball_List_key:
                    DragonballListComponentConnector() +
                        DragonballComponentComponent(),
                HomeRootKeys.Home_Play_List_Key:
                    HomePlayListComponentConnector() + HomePlayListComponent(),
                HomeRootKeys.Home_Chinese_Song_Part_Key:
                    HomeChineseSongComponentConnector() +
                        HomeChineseSongComponent(),
                HomeRootKeys.Home_Music_Calendar_Key:
                    HomeMusicCalendarComponentConnector() +
                        HomeMusicCalendarComponent(),
                HomeRootKeys.Home_Daytime_PlayList_Key:
                    HomeDaytimeComponentConnector() + HomePlayListComponent(),
                HomeRootKeys.Home_Country_Select_Key:
                    CountrySelectComponentConnector() +
                        CountrySelectComponent(),
                HomeRootKeys.Home_Live_Key:
                    HomeLiveComponentConnector() + HomeLiveComponent(),
              }),
          middleware: <Middleware<HomeRootState>>[],
        );
}
