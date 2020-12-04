import 'package:fish_redux/fish_redux.dart';
import 'package:fluro/fluro.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/manager/global_store/page.dart';
import 'package:zmusic_flutter/manager/global_store/state.dart';
import 'package:zmusic_flutter/views/account/account_root_page/page.dart';
import 'package:zmusic_flutter/views/global_music_player_page/page.dart';
import 'package:zmusic_flutter/views/country/country_root_page/page.dart';
import 'package:zmusic_flutter/views/home/home_root_page/page.dart';
import 'package:zmusic_flutter/views/login/login_page/page.dart';
import 'package:zmusic_flutter/views/mine/mine_root_page/page.dart';
import 'package:zmusic_flutter/views/video/video_root_page/page.dart';
import 'package:zmusic_flutter/views/webview_page/page.dart';

class XCAppRouter {
  static final String homeKey = "/HomeRoot/";
  static final String videoKey = "/VideoRoot/";
  static final String mineKey = "/MineRoot/";
  static final String countryKey = "/CountryRoot/";
  static final String accountKey = "/AccountRoot/";
  static final String detail = "/detail/";
  static final String login = "/login/";
  static final String globalMusicPlayer = "/globleMusicPlayer";

  static Map<String, Page<Object, dynamic>> getRouteMap() {
    final Map<String, Page<Object, dynamic>> routeMap = {
      homeKey: ApplicationManager.sharedInstance().homeRootPage,
      videoKey: ApplicationManager.sharedInstance().videoRootPage,
      mineKey: ApplicationManager.sharedInstance().mineRootPage,
      countryKey: ApplicationManager.sharedInstance().countryRootPage,
      accountKey: ApplicationManager.sharedInstance().accountRootPage,
      detail: WebviewPage(),
      login: LoginPage(),
      globalMusicPlayer: ApplicationManager.sharedInstance().globalPlayerPage
    };
    return routeMap;
  }

  static AbstractRoutes getRoutes() {
    _updateState() {
      return (Object pageState, GlobalStoreState appState) {
        final GlobalStoreBaseState p = pageState;

        if (pageState is Cloneable) {
          final Object copy = pageState.clone();
          final GlobalStoreBaseState newState = copy;
          if (p.playingSongId != appState.playingSongId) {
            newState.playingSongId = appState.playingSongId;
          }

          /// 返回新的 state 并将数据设置到 ui
          return newState;
        }
        return pageState;
      };
    }

    final AbstractRoutes routes = PageRoutes(
      pages: getRouteMap(),
      visitor: (String path, Page<Object, dynamic> page) {
        if (page.isTypeof<GlobalStoreBaseState>()) {
          ///建立AppStore驱动PageStore的单向数据连接： 参数1 AppStore  参数2 当AppStore.state变化时,PageStore.state该如何变化
          page.connectExtraStore<GlobalStoreState>(
              GlobalStore.store, _updateState());
        }
      },
    );
    return routes;
  }

  static void defineRoutes(FluroRouter router) {
    getRouteMap().forEach((key, value) {
      var handler = Handler(
        handlerFunc: (context, parameters) {
          return getRoutes().buildPage(key, parameters);
        },
      );
      router.define(key, handler: handler);
    });
  }
}
