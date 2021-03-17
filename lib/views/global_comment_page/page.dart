import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_bottombar_component/component.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_indicator_bar_component/component.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/component.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_topbar_component/component.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/keys.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GlobalCommentPage extends Page<GlobalCommentState, Map<String, dynamic>> {
  GlobalCommentPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<GlobalCommentState>(
              adapter: null,
              slots: <String, Dependent<GlobalCommentState>>{
                GlobalCommentComponentKeys.Top_Bar_Key:
                    CommentTopbarConnector() + CommentTopbarComponent(),
                GlobalCommentComponentKeys.Bottom_Bar_Key:
                    CommentBottombarConnector() + CommentBottombarComponent(),
                GlobalCommentComponentKeys.List_View_Key:
                    CommentListviewConnector() + CommentListviewComponent(),
                GlobalCommentComponentKeys.Indicator_Bar_Key:
                    CommentViewIndicatorBarConnector() +
                        CommentIndicatorBarComponent()
              }),
          middleware: <Middleware<GlobalCommentState>>[],
        );
}
