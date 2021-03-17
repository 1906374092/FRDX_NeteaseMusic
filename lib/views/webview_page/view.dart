import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zmusic_flutter/views/webview_page/action.dart';
import 'package:zmusic_flutter/views/webview_page/components/keys.dart';

import 'state.dart';

Widget buildView(
    WebviewState state, Dispatch dispatch, ViewService viewService) {
  return Container(
      width: state.deviceInfo.screenWidth,
      height: state.deviceInfo.screenHeight,
      color: Colors.white,
      child: Column(
        children: [
          viewService.buildComponent(WebviewPageKeys.Topbar_key),
          Container(
            width: state.deviceInfo.screenWidth,
            height:
                state.deviceInfo.screenHeight - state.deviceInfo.naviBarHeight,
            child: WebView(
              initialUrl: state.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebResourceError: (error) {
                print(error);
              },
              onWebViewCreated: (controller) {
                dispatch(WebviewActionCreator.onCreateController(controller));
              },
              onPageStarted: (url) {},
              onPageFinished: (url) {
                dispatch(WebviewActionCreator.onGetTitle());
              },
            ),
          )
        ],
      ));
}
