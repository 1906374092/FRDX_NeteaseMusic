import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/manager/local_storage.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/router/fade.dart';
import 'package:zmusic_flutter/router/router.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/views/tab/tab.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    this.jumpPage();
  }

  void jumpPage() async {
    StorageManager manager = await StorageManager.getInstance();
    Widget target;
    if (manager.loginInfo != null) {
      ApplicationManager.sharedInstance().loginInfo =
          Login_info.fromJson(manager.loginInfo);
      API.login.loginRefreshRequest();
      TabBarController tabController = TabBarController();
      target = tabController;
    } else {
      target = XCAppRouter.getRoutes().buildPage(XCAppRouter.login, null);
    }
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, FadeRoute(
        builder: (context) {
          return target;
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorDefine.Main_Red,
      child: Image(
        image: AssetImage("images/welcome/welcome.png"),
      ),
    );
  }
}
