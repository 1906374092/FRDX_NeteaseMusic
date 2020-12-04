import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/router/router.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';
import 'package:zmusic_flutter/views/welcome/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //app的一些初始化操作
  void initApp(BuildContext context) {
    ApplicationManager.sharedInstance().applicationInitial();
    ApplicationManager.sharedInstance().deviceInfo = DeviceInfo(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: WelcomePage(),
      onGenerateTitle: (context) {
        initApp(context);
        return "NetEaseMusic";
      },
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          builder: (context) {
            return XCAppRouter.getRoutes()
                .buildPage(settings.name, settings.arguments);
          },
        );
      },
    );
  }
}
