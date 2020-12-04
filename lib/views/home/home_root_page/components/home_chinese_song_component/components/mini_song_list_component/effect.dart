import 'package:fish_redux/fish_redux.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/manager/global_store/action.dart';
import 'package:zmusic_flutter/manager/global_store/page.dart';
import 'package:zmusic_flutter/manager/local_storage.dart';
import 'package:zmusic_flutter/manager/notification/event_bus.dart';
import 'package:zmusic_flutter/manager/notification/fishredux_broadcast.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/router/router.dart';
import 'package:zmusic_flutter/views/common/mini_player_component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/action.dart';
import 'action.dart';
import 'state.dart';

Effect<MiniSongListState> buildEffect() {
  return combineEffects(<Object, Effect<MiniSongListState>>{
    Lifecycle.initState: _onInit,
    MiniSongListAction.playAction: _onPlayAction,
    BroadcastAction.playSongAction: _onBroadcastPlaySong,
    MiniSongListAction.jumpToPlayer: _onJumpToPlayer
  });
}

void _onInit(Action action, Context<MiniSongListState> ctx) {}
void _onPlayAction(Action action, Context<MiniSongListState> ctx) async {
  Map data = action.payload;
  Resource resource = data["resource"];
  GlobalKey imageKey = data["imageKey"];
  // GlobalStore.store.dispatch(
  //     GlobalStoreActionCreator.onChangePlayingSongId(resource.resourceId));
  TickerProvider provider = ctx.stfState as TickerProvider;
  MiniPlayerPlayAnimationGenerator generator = MiniPlayerPlayAnimationGenerator(
      imageKey: imageKey,
      imageUrl: resource.uiElement.image.imageUrl,
      tickerProvider: provider);
  generator.showAnimation(ctx.context);
  bus.emit(BusEvent.PlayAudioWithSong, resource.resourceExtInfo.songData);
  ctx.broadcast(BroadcastActionCreator.onPlaySongAction(resource.resourceId));

  StorageManager manager = await StorageManager.getInstance();
  manager.addToLocalPlayList(resource.resourceExtInfo.songData);
}

void _onBroadcastPlaySong(Action action, Context<MiniSongListState> ctx) {
  String songId = action.payload;
  ctx.dispatch(MiniSongListActionCreator.onUpdatePlayingStatus(songId));
  ctx.dispatch(HomeChineseSongActionCreator.onGetData());
}

void _onJumpToPlayer(Action action, Context<MiniSongListState> ctx) {
  Navigator.of(ctx.context).pushNamed(XCAppRouter.globalMusicPlayer);
}
