import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';

class CommentSongBannerState implements Cloneable<CommentSongBannerState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  PlayerManager get playerManager =>
      ApplicationManager.sharedInstance().playerManager;
  @override
  CommentSongBannerState clone() {
    return CommentSongBannerState();
  }
}

CommentSongBannerState initState(Map<String, dynamic> args) {
  return CommentSongBannerState();
}
