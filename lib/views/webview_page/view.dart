import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zmusic_flutter/views/webview_page/action.dart';

import 'state.dart';

Widget buildView(
    WebviewState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth,
    height: state.deviceInfo.screenHeight,
    color: Colors.orange,
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
  );
}
