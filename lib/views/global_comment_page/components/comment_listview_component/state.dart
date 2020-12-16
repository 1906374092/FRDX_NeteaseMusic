import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/commen_playlist_banner_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_indicator_bar_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/adapter.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/comment_list_item_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_song_banner_component/state.dart';
import 'package:zmusic_flutter/views/global_comment_page/state.dart';

class CommentListviewState extends MutableSource
    implements Cloneable<CommentListviewState> {
  CommentListviewState({this.type, this.commentIndicatorBarState});
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  CommentSongBannerState commentSongBannerState;
  CommenPlaylistBannerState commenPlaylistBannerState;
  CommentIndicatorBarState commentIndicatorBarState;

  ScrollController controller = ScrollController();
  RefreshController refreshController = RefreshController();

  final CommentType type;

  SongData get songData =>
      ApplicationManager.sharedInstance().playerManager.sonngData;

  List<CommentListItemState> items;

  @override
  CommentListviewState clone() {
    return CommentListviewState()
      ..items = items
      ..commentSongBannerState = commentSongBannerState
      ..commenPlaylistBannerState = commenPlaylistBannerState
      ..controller = controller
      ..commentIndicatorBarState = commentIndicatorBarState;
  }

  @override
  Object getItemData(int index) {
    return items == null ? null : items[index];
  }

  @override
  String getItemType(int index) {
    return CommentListviewAdapter.item_style;
  }

  @override
  int get itemCount => items == null ? 1 : items.length;

  @override
  void setItemData(int index, Object data) {
    items[index] = data;
  }
}

///歌曲banner连接器
class CommentSongBannerConnector
    extends ConnOp<CommentListviewState, CommentSongBannerState> {
  @override
  void set(CommentListviewState state, CommentSongBannerState subState) {
    state.commentSongBannerState = subState;
  }

  @override
  CommentSongBannerState get(CommentListviewState state) {
    return state.commentSongBannerState;
  }
}

///歌单banner连接器
class CommentPlaylistBannerConnector
    extends ConnOp<CommentListviewState, CommenPlaylistBannerState> {
  @override
  void set(CommentListviewState state, CommenPlaylistBannerState subState) {
    state.commenPlaylistBannerState = subState;
  }

  @override
  CommenPlaylistBannerState get(CommentListviewState state) {
    return state.commenPlaylistBannerState;
  }
}

///评论区头部连接器
class CommentIndicatorBarConnector
    extends ConnOp<CommentListviewState, CommentIndicatorBarState> {
  @override
  void set(CommentListviewState state, CommentIndicatorBarState subState) {
    state.commentIndicatorBarState = subState;
  }

  @override
  CommentIndicatorBarState get(CommentListviewState state) {
    return state.commentIndicatorBarState;
  }
}
