import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/commen_playlist_banner_component/component.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_indicator_bar_component/component.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/adapter.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_song_banner_component/component.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/keys.dart';
import 'package:zmusic_flutter/views/global_comment_page/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentListviewComponent extends Component<CommentListviewState> {
  CommentListviewComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CommentListviewState>(
              adapter:
                  NoneConn<CommentListviewState>() + CommentListviewAdapter(),
              slots: <String, Dependent<CommentListviewState>>{
                GlobalCommentComponentKeys.Song_Banner_Key:
                    CommentSongBannerConnector() + CommentSongBannerComponent(),
                GlobalCommentComponentKeys.Playlist_Banner_Key:
                    CommentPlaylistBannerConnector() +
                        CommenPlaylistBannerComponent(),
                GlobalCommentComponentKeys.Indicator_Bar_Key:
                    CommentIndicatorBarConnector() +
                        CommentIndicatorBarComponent(),
              }),
        );
}
