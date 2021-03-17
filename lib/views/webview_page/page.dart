import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/webview_page/components/keys.dart';
import 'package:zmusic_flutter/views/webview_page/components/webview_topbar_component/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WebviewPage extends Page<WebviewState, Map<String, dynamic>> {
  WebviewPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<WebviewState>(
              adapter: null,
              slots: <String, Dependent<WebviewState>>{
                WebviewPageKeys.Topbar_key:
                    WebviewTopbarConnector() + WebviewTopbarComponent()
              }),
          middleware: <Middleware<WebviewState>>[],
        );
}
