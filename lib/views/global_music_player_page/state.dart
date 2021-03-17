import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_background_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_buttonsbar_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_centercover_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_controlpad_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_lyrics_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_topbar_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';

class GlobalMusicPlayerState implements Cloneable<GlobalMusicPlayerState> {
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  PlayerManager playerManager;

  bool showLyrics = false;

  GlobalPlayerBackgroundState globalPlayerBackgroundState;
  GlobalPlayerTopbarState globalPlayerTopbarState;
  GlobalPlayerCentercoverState globalPlayerCentercoverState;
  GlobalPlayerButtonsbarState globalPlayerButtonsbarState;
  GlobalPlayerControlpadState globalPlayerControlpadState;
  GlobalPlayerLyricsState globalPlayerLyricsState;

  @override
  GlobalMusicPlayerState clone() {
    return GlobalMusicPlayerState()
      ..globalPlayerBackgroundState = globalPlayerBackgroundState
      ..playerManager = playerManager
      ..globalPlayerTopbarState = globalPlayerTopbarState
      ..globalPlayerCentercoverState = globalPlayerCentercoverState
      ..globalPlayerButtonsbarState = globalPlayerButtonsbarState
      ..globalPlayerControlpadState = globalPlayerControlpadState
      ..globalPlayerLyricsState = globalPlayerLyricsState
      ..showLyrics = showLyrics;
  }
}

GlobalMusicPlayerState initState(Map<String, dynamic> args) {
  return GlobalMusicPlayerState()
    ..globalPlayerBackgroundState = GlobalPlayerBackgroundState()
    ..playerManager = ApplicationManager.sharedInstance().playerManager
    ..globalPlayerTopbarState = GlobalPlayerTopbarState()
    ..globalPlayerCentercoverState = GlobalPlayerCentercoverState()
    ..globalPlayerButtonsbarState = GlobalPlayerButtonsbarState()
    ..globalPlayerControlpadState = GlobalPlayerControlpadState()
    ..globalPlayerLyricsState = GlobalPlayerLyricsState();
}

///背景组件连接器
class BackGroundComponentConnector
    extends ConnOp<GlobalMusicPlayerState, GlobalPlayerBackgroundState> {
  @override
  void set(GlobalMusicPlayerState state, GlobalPlayerBackgroundState subState) {
    state.globalPlayerBackgroundState = subState;
  }

  @override
  GlobalPlayerBackgroundState get(GlobalMusicPlayerState state) {
    return state.globalPlayerBackgroundState;
  }
}

///导航栏组件连接器
class GlobalPlayerTopbarConnector
    extends ConnOp<GlobalMusicPlayerState, GlobalPlayerTopbarState> {
  @override
  void set(GlobalMusicPlayerState state, GlobalPlayerTopbarState subState) {
    state.globalPlayerTopbarState = subState;
  }

  @override
  GlobalPlayerTopbarState get(GlobalMusicPlayerState state) {
    return state.globalPlayerTopbarState;
  }
}

///专辑图片旋转组件
class GlobalPlayerCentercoverConnector
    extends ConnOp<GlobalMusicPlayerState, GlobalPlayerCentercoverState> {
  @override
  void set(
      GlobalMusicPlayerState state, GlobalPlayerCentercoverState subState) {
    state.globalPlayerCentercoverState = subState;
  }

  @override
  GlobalPlayerCentercoverState get(GlobalMusicPlayerState state) {
    return state.globalPlayerCentercoverState;
  }
}

///点赞评论系列按钮
class GlobalPlayerButtonsbarConnector
    extends ConnOp<GlobalMusicPlayerState, GlobalPlayerButtonsbarState> {
  @override
  void set(GlobalMusicPlayerState state, GlobalPlayerButtonsbarState subState) {
    state.globalPlayerButtonsbarState = subState;
  }

  @override
  GlobalPlayerButtonsbarState get(GlobalMusicPlayerState state) {
    return state.globalPlayerButtonsbarState;
  }
}

///音乐播放控制条
class GlobalPlayerControlpadConnector
    extends ConnOp<GlobalMusicPlayerState, GlobalPlayerControlpadState> {
  @override
  void set(GlobalMusicPlayerState state, GlobalPlayerControlpadState subState) {
    state.globalPlayerControlpadState = subState;
  }

  @override
  GlobalPlayerControlpadState get(GlobalMusicPlayerState state) {
    return state.globalPlayerControlpadState;
  }
}

///歌词组件连接器
class GlobalPlayerLyricsConnector
    extends ConnOp<GlobalMusicPlayerState, GlobalPlayerLyricsState> {
  @override
  void set(GlobalMusicPlayerState state, GlobalPlayerLyricsState subState) {
    state.globalPlayerLyricsState = subState;
  }

  @override
  GlobalPlayerLyricsState get(GlobalMusicPlayerState state) {
    return state.globalPlayerLyricsState;
  }
}
