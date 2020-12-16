import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/router/router.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/views/common/mini_player_component.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';

class TabBarController extends StatefulWidget {
  TabBarController() : super();

  @override
  _TabBarControllerState createState() {
    return _TabBarControllerState();
  }
}

class _TabBarControllerState extends State<TabBarController>
    with TickerProviderStateMixin {
  final Widget _homePage =
      XCAppRouter.getRoutes().buildPage(XCAppRouter.homeKey, null);
  final Widget _videoPage =
      XCAppRouter.getRoutes().buildPage(XCAppRouter.videoKey, null);
  final Widget _minePage =
      XCAppRouter.getRoutes().buildPage(XCAppRouter.mineKey, null);
  final Widget _countryPage =
      XCAppRouter.getRoutes().buildPage(XCAppRouter.countryKey, null);
  final Widget _accountPage =
      XCAppRouter.getRoutes().buildPage(XCAppRouter.accountKey, null);

  List<AnimationController> _controllers = [];

  final Color _inactiveColor = Colors.grey[600];
  final Color _activeColor = ColorDefine.Main_Red;

  final double _inactiveIconSize = 22;
  double _activeBgSize = 26;
  final double _activeIconSize = 16;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 5; i++) {
      AnimationController controller = AnimationController(
          duration: Duration(milliseconds: 150), vsync: this);
      _controllers.add(controller);
      controller.forward();
    }
    Future.delayed(Duration(milliseconds: 500), () {
      MiniPlayerOverlayConfiger.showPlayer(context);
    });

    ApplicationManager.sharedInstance().baseContext = context;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          onTap: (value) {
            for (var i = 0; i < 5; i++) {
              if (value == i) {
                _controllers[i].forward();
              } else {
                _controllers[i].reset();
              }
            }
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  XCIcons.home,
                  size: _inactiveIconSize,
                  color: _inactiveColor,
                ),
                activeIcon: ScaleTransition(
                  alignment: Alignment.center,
                  scale: _controllers[0],
                  child: Container(
                    width: _activeBgSize,
                    height: _activeBgSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_activeBgSize / 2),
                        gradient: LinearGradient(
                            colors: [Colors.red[300], Colors.red])),
                    child: Icon(
                      XCIcons.home,
                      size: _activeIconSize,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: '发现'),
            BottomNavigationBarItem(
                icon: Icon(
                  XCIcons.video,
                  size: _inactiveIconSize,
                  color: _inactiveColor,
                ),
                activeIcon: ScaleTransition(
                  scale: _controllers[1],
                  alignment: Alignment.center,
                  child: Container(
                    width: _activeBgSize,
                    height: _activeBgSize,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red[300], Colors.red]),
                        borderRadius: BorderRadius.circular(13)),
                    child: Icon(
                      XCIcons.video,
                      size: _activeIconSize,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: '视频'),
            BottomNavigationBarItem(
                icon: Icon(
                  XCIcons.mine,
                  size: 20,
                  color: _inactiveColor,
                ),
                activeIcon: ScaleTransition(
                  scale: _controllers[2],
                  alignment: Alignment.center,
                  child: Container(
                    width: _activeBgSize,
                    height: _activeBgSize,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red[300], Colors.red]),
                        borderRadius: BorderRadius.circular(13)),
                    child: Icon(
                      XCIcons.mine,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: '我的'),
            BottomNavigationBarItem(
                icon: Icon(
                  XCIcons.country,
                  size: 19,
                  color: _inactiveColor,
                ),
                activeIcon: ScaleTransition(
                  scale: _controllers[3],
                  alignment: Alignment.center,
                  child: Container(
                    width: _activeBgSize,
                    height: _activeBgSize,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red[300], Colors.red]),
                        borderRadius: BorderRadius.circular(13)),
                    child: Icon(
                      XCIcons.country,
                      size: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: '云村'),
            BottomNavigationBarItem(
                icon: Icon(
                  XCIcons.account,
                  size: 20,
                  color: _inactiveColor,
                ),
                activeIcon: ScaleTransition(
                  scale: _controllers[4],
                  alignment: Alignment.center,
                  child: Container(
                    width: _activeBgSize,
                    height: _activeBgSize,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red[300], Colors.red]),
                        borderRadius: BorderRadius.circular(13)),
                    child: Icon(
                      XCIcons.account,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: '账号'),
          ],
          iconSize: 22,
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
        ),
        tabBuilder: (context, index) {
          return IndexedStack(
            children: [
              _homePage,
              _videoPage,
              _minePage,
              _countryPage,
              _accountPage
            ],
            index: index,
          );
        });
  }
}
