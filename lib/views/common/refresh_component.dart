import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';

class RefreshComponent {
  static CustomFooter getFooter() {
    return CustomFooter(
      builder: (context, mode) {
        Widget icon;
        Text text;
        if (mode == LoadStatus.idle) {
          icon = Text("↑");
          text = Text("到底了，上拉换新一批内容");
        }
        return Container(
            height: 55,
            child: Column(
              children: [
                Container(
                  child: icon,
                ),
                Container(
                  child: text,
                )
              ],
            ));
      },
    );
  }

  static CustomHeader getHeader() {
    return CustomHeader(
      builder: (context, mode) {
        bool offstage = true;
        if (mode == RefreshStatus.refreshing ||
            mode == RefreshStatus.canRefresh) {
          offstage = false;
        } else {
          offstage = true;
        }
        return Container(
            padding: EdgeInsets.only(top: 50),
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Offstage(
                  offstage: offstage,
                  child: Container(
                    child: SpinKitRipple(
                      borderWidth: 1,
                      color: ColorDefine.Main_Light_Grey,
                      size: 100,
                    ),
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Icon(
                      XCIcons.home,
                      size: 30,
                      color: ColorDefine.Main_Light_Grey,
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  static loadingMoreFooter() {
    double screenWidth =
        ApplicationManager.sharedInstance().deviceInfo.screenWidth;
    return CustomFooter(
      builder: (context, mode) {
        if (mode == LoadStatus.canLoading) {
          return Container(
            padding: EdgeInsets.only(top: 20),
            width: screenWidth,
            alignment: Alignment.center,
            child: Text(
              "上拉加载更多",
              style:
                  TextStyle(color: ColorDefine.Light_grey_text, fontSize: 15),
            ),
          );
        }
        if (mode == LoadStatus.loading) {
          return Container(
            padding: EdgeInsets.only(top: 20),
            width: screenWidth,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: SpinKitWave(
                    size: 10,
                    color: ColorDefine.Login_BG,
                    duration: Duration(milliseconds: 800),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "加载中...",
                    style: TextStyle(
                        color: ColorDefine.Light_grey_text, fontSize: 15),
                  ),
                )
              ],
            ),
          );
        }
        return Container(
          padding: EdgeInsets.only(top: 20),
          width: screenWidth,
          alignment: Alignment.center,
          child: Text("没有更多了",
              style:
                  TextStyle(color: ColorDefine.Light_grey_text, fontSize: 15)),
        );
      },
    );
  }
}
