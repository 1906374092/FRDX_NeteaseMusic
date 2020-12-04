import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/notification/event_bus.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/network/api.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_background_component/action.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_centercover_component/action.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_lyrics_component/action.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_topbar_component/action.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalMusicPlayerState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalMusicPlayerState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
  });
}

void _onInit(Action action, Context<GlobalMusicPlayerState> ctx) {
  getSongDetail(ctx);
  _configCallback(ctx);
  _getLyrics(ctx);
  bus.emit(BusEvent.DismissMiniPlayer);

  ctx.state.globalPlayerControlpadState.changeSongCallback = () {
    getSongDetail(ctx);
    _getLyrics(ctx);
  };
}

void _configCallback(Context<GlobalMusicPlayerState> ctx) {
  ctx.state.globalPlayerCentercoverState.hide = () {
    ctx.dispatch(GlobalMusicPlayerActionCreator.onShowLyrics(true));
  };
  ctx.state.globalPlayerLyricsState.hide = () {
    ctx.dispatch(GlobalMusicPlayerActionCreator.onShowLyrics(false));
  };
}

void getSongDetail(Context<GlobalMusicPlayerState> ctx) async {
  ctx.dispatch(GlobalPlayerBackgroundActionCreator.onUpdateCover(
      ctx.state.playerManager.coverUrl));
  ctx.dispatch(GlobalPlayerTopbarActionCreator.onUpdateInfo({
    "title": ctx.state.playerManager.songName,
    "author": ctx.state.playerManager.author
  }));
  ctx.dispatch(GlobalPlayerCentercoverActionCreator.onUpdateCover(
      ctx.state.playerManager.coverUrl));
}

void _getLyrics(Context<GlobalMusicPlayerState> ctx) async {
  Map data = await API.song
      .getSongLyricsRequest(ctx.state.playerManager.sonngData.id.toString());
  LyricsResponse lyricsResponse = LyricsResponse.fromJson(data);
  if (lyricsResponse.lrc == null) {
    ctx.dispatch(GlobalMusicPlayerActionCreator.onSetLyricsData(null));
    ctx.dispatch(GlobalPlayerLyricsActionCreator.onUpdate());
    return;
  }
  String lyrics = lyricsResponse.lrc.lyric;
  List<String> originList = lyrics.split("\n");
  List<Map> result = List.generate(originList.length, (index) {
    String item = originList[index];
    if (item.contains("]")) {
      List<String> tempList = item.split("]");
      Map finalItem = {tempList[0].substring(1): tempList[1]};
      return finalItem;
    } else {
      return {"": ""};
    }
  });
  ctx.dispatch(GlobalMusicPlayerActionCreator.onSetLyricsData(result));
  ctx.dispatch(GlobalPlayerLyricsActionCreator.onUpdate());
}

void _onDispose(Action action, Context<GlobalMusicPlayerState> ctx) {
  Future.delayed(Duration(milliseconds: 300), () {
    bus.emit(BusEvent.ShowMiniPlayer);
  });
}
