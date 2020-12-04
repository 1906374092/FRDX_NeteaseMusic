import 'package:audioplayers/audioplayers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:zmusic_flutter/manager/notification/event_bus.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/router/router.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/account/account_root_page/page.dart';
import 'package:zmusic_flutter/views/global_music_player_page/page.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';
import 'package:zmusic_flutter/views/common/mini_player_component.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';
import 'package:zmusic_flutter/views/country/country_root_page/page.dart';
import 'package:zmusic_flutter/views/home/home_root_page/page.dart';
import 'package:zmusic_flutter/views/mine/mine_root_page/page.dart';
import 'package:zmusic_flutter/views/video/video_root_page/page.dart';

class ApplicationManager {
  ApplicationManager._();

  static final _instance = ApplicationManager._();
  factory ApplicationManager.sharedInstance() => _instance;

  FluroRouter router = FluroRouter();
  DeviceInfo deviceInfo;
  Login_info loginInfo;
  String playingSongId;
  static Logger logger = Logger();
  GlobalMusicPlayerPage globalPlayerPage = GlobalMusicPlayerPage();
  HomeRootPage homeRootPage = HomeRootPage();
  VideoRootPage videoRootPage = VideoRootPage();
  MineRootPage mineRootPage = MineRootPage();
  CountryRootPage countryRootPage = CountryRootPage();
  AccountRootPage accountRootPage = AccountRootPage();
  BuildContext baseContext;

  PlayerManager playerManager = PlayerManager();

  OverlayEntry miniPlayerEntry = new OverlayEntry(builder: (context) {
    return Positioned(
        top: ApplicationManager.sharedInstance().deviceInfo.statusBarHeight,
        right: 0,
        child: MiniTopBarPlayerComponent());
  });

  void applicationInitial() {
    /*
    应用全局初始化
    */

    //路由初始化
    XCAppRouter.defineRoutes(router);
  }
}
