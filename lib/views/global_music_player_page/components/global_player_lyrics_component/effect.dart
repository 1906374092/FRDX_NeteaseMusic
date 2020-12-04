import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:sys_volume/flutter_volume.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/tools.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalPlayerLyricsState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalPlayerLyricsState>>{
    GlobalPlayerLyricsAction.hide: _onHide,
    Lifecycle.initState: _onInit,
    GlobalPlayerLyricsAction.scrollAnimation: _onScrollAnimation,
    Lifecycle.dispose: _onDispose,
    GlobalPlayerLyricsAction.seekLyricLine: _onSeekLyricLine,
  });
}

///控制歌词和专辑封面切换
void _onHide(Action action, Context<GlobalPlayerLyricsState> ctx) {
  ctx.state.hide != null
      ? ctx.state.hide()
      : ApplicationManager.logger.w("lyric hide action not implement");
}

void _onInit(Action action, Context<GlobalPlayerLyricsState> ctx) {
  FlutterVolume.get(type: FlutterVolume.STREAM_MUSIC).then((value) =>
      ctx.dispatch(GlobalPlayerLyricsActionCreator.onUpdateVolumeValue(value)));

  ctx.state.playerManager.player.onAudioPositionChanged
      .listen((Duration duration) {
    for (var i = 0; i < ctx.state.temp.length; i++) {
      if (duration.inMilliseconds >= ctx.state.temp[i] &&
          duration.inMilliseconds < ctx.state.temp[i + 1]) {
        if (ctx.state.tempflag != i) {
          ctx.dispatch(
              GlobalPlayerLyricsActionCreator.onUpdateLyricsActiveLine(i));
          ctx.dispatch(GlobalPlayerLyricsActionCreator.onScrollAnimation(i));
          ctx.state.tempflag = i;
        }
        break;
      }
    }
  });
}

///歌词滚动事件
void _onScrollAnimation(Action action, Context<GlobalPlayerLyricsState> ctx) {
  int activeline = action.payload;
  ctx.state.pageController.animateToPage(activeline,
      duration: Duration(milliseconds: 400), curve: Curves.linear);
}

///根据歌词跳转播放
void _onSeekLyricLine(Action action, Context<GlobalPlayerLyricsState> ctx) {
  int index = ctx.state.pageController.page.toInt();
  Map lyricData = ctx.state.lyrics[index];
  String timeString = lyricData.keys.first;
  Duration seekDuration = Tools.timeStringToDuration(timeString);
  ApplicationManager.sharedInstance().playerManager.player.seek(seekDuration);
}

void _onDispose(Action action, Context<GlobalPlayerLyricsState> ctx) {
  ctx.state.pageController.dispose();
}
