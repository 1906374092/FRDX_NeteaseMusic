import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zmusic_flutter/utils/colors.dart';

class PageUtil {
  static bool _loading = false;

  static void showToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black.withOpacity(0.8),
        textColor: Colors.white,
        fontSize: 15);
  }

  static OverlayEntry _loadingEntry = new OverlayEntry(builder: (context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitRing(
              color: Colors.white,
              size: 40,
              lineWidth: 5,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "努力加载中",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  });
  static void showLoading(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    if (!_loading) {
      _loading = true;
      overlayState.insert(_loadingEntry);
    }
  }

  static void dismissLoading() {
    if (_loading) {
      _loading = false;
      _loadingEntry.remove();
    }
  }

  static Widget pageLoadingPlaceholder() {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: [
          SpinKitWave(
            // color: ColorDefine.Login_BG,
            itemCount: 4,
            size: 20,
            itemBuilder: (context, index) {
              return Container(
                // color: ColorDefine.Login_BG,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: ColorDefine.Login_BG),
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              "正在加载...",
              style:
                  TextStyle(color: ColorDefine.Light_grey_text, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
