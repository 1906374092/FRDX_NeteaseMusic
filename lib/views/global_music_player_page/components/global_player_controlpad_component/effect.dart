import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/manager/local_storage.dart';
import 'package:zmusic_flutter/manager/notification/event_bus.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/views/common/common_progressbar_component/action.dart';
import 'package:zmusic_flutter/views/common/common_progressbar_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_background_component/action.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_centercover_component/action.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_localplaylist_component/state.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_topbar_component/action.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/keys.dart';
import 'package:zmusic_flutter/views/global_music_player_page/player_manager.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalPlayerControlpadState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalPlayerControlpadState>>{
    GlobalPlayerControlpadAction.action: _onAction,
    Lifecycle.initState: onInit,
    GlobalPlayerControlpadAction.play: _onPlay,
    GlobalPlayerControlpadAction.pause: _onPause,
    GlobalPlayerControlpadAction.showLocalPlaylist: _onShowLocalPlaylist,
    GlobalPlayerControlpadAction.changePlayListOption: _onChangePlayListOption,
    GlobalPlayerControlpadAction.playPrevious: _onPlayPrevious,
    GlobalPlayerControlpadAction.playNext: _onPlayNext,
    GlobalPlayerControlpadAction.handleItemChange: _onHandleItemTap,
  });
}

void _onAction(Action action, Context<GlobalPlayerControlpadState> ctx) {}
void onInit(Action action, Context<GlobalPlayerControlpadState> ctx) {
  ctx.state.commonProgressbarState = CommonProgressbarState();
  ctx.state.globalPlayerLocalplaylistState = GlobalPlayerLocalplaylistState();
  ctx.state.playerManager.player.onAudioPositionChanged.listen((Duration p) {
    if (!ctx.state.commonProgressbarState.seeking) {
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onUpdateProgressData({
        "current": p.inSeconds,
        "total": ctx.state.playerManager.totalDuration.inSeconds
      }));
      ctx.dispatch(CommonProgressbarActionCreator.onUpdate());
    }
  });
  ctx.state.commonProgressbarState.seekEndCallback = (double value) {
    ctx.state.playerManager.player.seek(Duration(seconds: value.toInt()));
  };

  PlayerManager playerManager =
      ApplicationManager.sharedInstance().playerManager;
  if (playerManager.player.state == AudioPlayerState.PLAYING) {
    ctx.dispatch(
        GlobalPlayerCentercoverActionCreator.onUpdatePlayingStatus(true));
    ctx.dispatch(
        GlobalPlayerControlpadActionCreator.onUpdatePlayingStatus(true));
  } else {
    ctx.dispatch(
        GlobalPlayerCentercoverActionCreator.onUpdatePlayingStatus(false));
    ctx.dispatch(
        GlobalPlayerControlpadActionCreator.onUpdatePlayingStatus(false));
  }
  //读取播放顺序图标
  _setPlayOptionIcon(ctx);
  _listenMusicStatus(action, ctx);
  _setPlayList(ctx);
}

void _onHandleItemTap(Action action, Context<GlobalPlayerControlpadState> ctx) {
  List<SongData> localList = ctx.state.playerManager.getCurrentPlayList;
  SongData song = action.payload;
  bus.emit(BusEvent.PlayAudioWithSong, song);
  ctx.state.changeSongCallback != null
      ? ctx.state.changeSongCallback()
      : ApplicationManager.logger.w("not implement player changeSongCallback");
  ctx.dispatch(
      GlobalPlayerCentercoverActionCreator.onUpdatePlayingStatus(true));
  ctx.dispatch(GlobalPlayerControlpadActionCreator.onUpdatePlayingStatus(true));
  ctx.dispatch(GlobalPlayerCentercoverActionCreator.onSetCouldSwipe(false));
  for (SongData item in localList) {
    if (item.id == song.id) {
      ctx.dispatch(GlobalPlayerCentercoverActionCreator.onMusicSwitch(
          SwitchType.any,
          index: localList.indexOf(item)));
    }
  }
}

void _setPlayList(Context<GlobalPlayerControlpadState> ctx) async {
  await ctx.state.playerManager.setCurrentPlayList();
  ctx.dispatch(GlobalPlayerCentercoverActionCreator.onUpdateLocalPlayList(
      ctx.state.playerManager.getCurrentPlayList));
}

///监听音乐播放结束
void _listenMusicStatus(
    Action action, Context<GlobalPlayerControlpadState> ctx) {
  bus.on(BusEvent.AutoPlayNext, (arg) {
    SongData song = arg;
    ctx.state.changeSongCallback != null
        ? ctx.state.changeSongCallback()
        : ApplicationManager.logger
            .w("not implement player changeSongCallback");
    ctx.dispatch(
        GlobalPlayerBackgroundActionCreator.onUpdateCover(song.album.picUrl));
    ctx.dispatch(GlobalPlayerTopbarActionCreator.onUpdateInfo(
        {"title": song.name, "author": song.artists[0].name}));
    ctx.dispatch(
        GlobalPlayerCentercoverActionCreator.onUpdatePlayingStatus(true));
    ctx.dispatch(
        GlobalPlayerControlpadActionCreator.onUpdatePlayingStatus(true));
    ctx.dispatch(
        GlobalPlayerCentercoverActionCreator.onMusicSwitch(SwitchType.next));
  });
}

///按播放顺序设置配置实时播放列表

///播放
void _onPlay(Action action, Context<GlobalPlayerControlpadState> ctx) {
  ctx.dispatch(
      GlobalPlayerCentercoverActionCreator.onUpdatePlayingStatus(true));
  ctx.dispatch(GlobalPlayerControlpadActionCreator.onUpdatePlayingStatus(true));
  if (ctx.state.playerManager.player.state == AudioPlayerState.PAUSED) {
    ctx.state.playerManager.player.resume();
  } else {
    bus.emit(BusEvent.PlayAudioWithSong, ctx.state.playerManager.sonngData);
  }
}

///暂停
void _onPause(Action action, Context<GlobalPlayerControlpadState> ctx) {
  ctx.dispatch(
      GlobalPlayerCentercoverActionCreator.onUpdatePlayingStatus(false));
  ctx.dispatch(
      GlobalPlayerControlpadActionCreator.onUpdatePlayingStatus(false));
  ctx.state.playerManager.player.pause();
}

///显示播放列表
void _onShowLocalPlaylist(
    Action action, Context<GlobalPlayerControlpadState> ctx) {
  showCupertinoModalPopup(
    context: ctx.context,
    builder: (context) =>
        ctx.buildComponent(GlobalMusicPlayerPageKeys.Local_Play_List_Key),
  );
}

///初始化播放顺序
void _setPlayOptionIcon(Context<GlobalPlayerControlpadState> ctx) async {
  PlayListOption option =
      await ApplicationManager.sharedInstance().playerManager.playListOption;
  switch (option) {
    case PlayListOption.RandomCycle:
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onSetPlayListOptionIcon(
          XCIcons.random_play));
      break;
    case PlayListOption.OrderCycle:
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onSetPlayListOptionIcon(
          XCIcons.sequential_play));
      break;
    case PlayListOption.SingleCycle:
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onSetPlayListOptionIcon(
          XCIcons.single_cycle));
      break;
    default:
  }
}

///切换播放顺序
void _onChangePlayListOption(
    Action action, Context<GlobalPlayerControlpadState> ctx) async {
  StorageManager manager = await StorageManager.getInstance();
  switch (manager.playListOption) {
    case PlayListOption.OrderCycle:
      PageUtil.showToast("随机播放");
      manager.playListOption = PlayListOption.RandomCycle;
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onSetPlayListOptionIcon(
          XCIcons.random_play));
      break;
    case PlayListOption.RandomCycle:
      PageUtil.showToast("单曲循环");
      manager.playListOption = PlayListOption.SingleCycle;
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onSetPlayListOptionIcon(
          XCIcons.single_cycle));
      break;
    case PlayListOption.SingleCycle:
      PageUtil.showToast("列表循环");
      manager.playListOption = PlayListOption.OrderCycle;
      ctx.dispatch(GlobalPlayerControlpadActionCreator.onSetPlayListOptionIcon(
          XCIcons.sequential_play));
      break;
    default:
  }
  ctx.state.playerManager.setCurrentPlayList();
}

///上一曲
void _onPlayPrevious(Action action, Context<GlobalPlayerControlpadState> ctx) {
  SongData song = ctx.state.playerManager.sonngData;
  int currentIndex = 0;
  for (SongData item in ctx.state.currentPlayList) {
    if (item.id == song.id) {
      currentIndex = ctx.state.currentPlayList.indexOf(item);
    }
  }
  int previousIndex;
  if (ctx.state.currentPlayList.length == 1) {
    previousIndex = 0;
  } else {
    if (currentIndex == 0) {
      previousIndex = ctx.state.currentPlayList.length - 1;
    } else {
      previousIndex = currentIndex - 1;
    }
  }
  bus.emit(
      BusEvent.PlayAudioWithSong, ctx.state.currentPlayList[previousIndex]);
  ctx.state.changeSongCallback != null
      ? ctx.state.changeSongCallback()
      : ApplicationManager.logger.w("not implement player changeSongCallback");
  ctx.dispatch(GlobalPlayerBackgroundActionCreator.onUpdateCover(
      ctx.state.currentPlayList[previousIndex].album.picUrl));
  ctx.dispatch(GlobalPlayerTopbarActionCreator.onUpdateInfo({
    "title": ctx.state.currentPlayList[previousIndex].name,
    "author": ctx.state.currentPlayList[previousIndex].artists[0].name
  }));
  ctx.dispatch(
      GlobalPlayerCentercoverActionCreator.onUpdatePlayingStatus(true));
  ctx.dispatch(GlobalPlayerControlpadActionCreator.onUpdatePlayingStatus(true));

  bool animate = action.payload;
  if (animate) {
    ctx.dispatch(GlobalPlayerCentercoverActionCreator.onMusicSwitch(
        SwitchType.previous));
  }
}

///下一曲
void _onPlayNext(Action action, Context<GlobalPlayerControlpadState> ctx) {
  SongData song = ctx.state.playerManager.sonngData;
  int currentIndex = 0;
  for (SongData item in ctx.state.currentPlayList) {
    if (item.id == song.id) {
      currentIndex = ctx.state.currentPlayList.indexOf(item);
    }
  }
  int nextIndex;
  if (ctx.state.currentPlayList.length == 1) {
    nextIndex = 0;
  } else {
    if (currentIndex == ctx.state.currentPlayList.length - 1) {
      nextIndex = 0;
    } else {
      nextIndex = currentIndex + 1;
    }
  }
  bus.emit(BusEvent.PlayAudioWithSong, ctx.state.currentPlayList[nextIndex]);
  ctx.state.changeSongCallback != null
      ? ctx.state.changeSongCallback()
      : ApplicationManager.logger.w("not implement player changeSongCallback");
  ctx.dispatch(GlobalPlayerBackgroundActionCreator.onUpdateCover(
      ctx.state.currentPlayList[nextIndex].album.picUrl));
  ctx.dispatch(GlobalPlayerTopbarActionCreator.onUpdateInfo({
    "title": ctx.state.currentPlayList[nextIndex].name,
    "author": ctx.state.currentPlayList[nextIndex].artists[0].name
  }));
  ctx.dispatch(
      GlobalPlayerCentercoverActionCreator.onUpdatePlayingStatus(true));
  ctx.dispatch(GlobalPlayerControlpadActionCreator.onUpdatePlayingStatus(true));
  bool animate = action.payload;
  if (animate) {
    ctx.dispatch(
        GlobalPlayerCentercoverActionCreator.onMusicSwitch(SwitchType.next));
  }
}
