import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_controlpad_component/action.dart';
import 'action.dart';
import 'state.dart';

Effect<GlobalPlayerCentercoverState> buildEffect() {
  return combineEffects(<Object, Effect<GlobalPlayerCentercoverState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
    GlobalPlayerCentercoverAction.updatePlayingStatus: _onUpdatePlayingStatus,
    GlobalPlayerCentercoverAction.hide: _onHide,
    GlobalPlayerCentercoverAction.pause: _onPause,
    GlobalPlayerCentercoverAction.play: _onPlay,
    GlobalPlayerCentercoverAction.swiperIndexChanged: _onSwiperIndexChanged
  });
}

void _onInit(Action action, Context<GlobalPlayerCentercoverState> ctx) {
  _configCoverAnimation(ctx);
  _configArmAnimation(ctx);
  _configSwiper(ctx);
}

void _configSwiper(Context<GlobalPlayerCentercoverState> ctx) {
  ctx.state.swiperController = SwiperController();
  ctx.state.swiperController.addListener(() {});
}

///初始化封面旋转动画
void _configCoverAnimation(Context<GlobalPlayerCentercoverState> ctx) {
  TickerProvider provider = ctx.stfState as TickerProvider;
  ctx.state.coverController =
      AnimationController(duration: Duration(seconds: 15), vsync: provider);
  if (ApplicationManager.sharedInstance().playerManager.player.state ==
      AudioPlayerState.PLAYING) {
    ctx.state.coverController.forward();
  }
  ctx.state.coverController.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      ctx.state.coverController.reset();
      ctx.state.coverController.forward();
    }
  });
}

///初始化机械臂动画
void _configArmAnimation(Context<GlobalPlayerCentercoverState> ctx) {
  TickerProvider provider = ctx.stfState as TickerProvider;
  ctx.state.armController = AnimationController(
      duration: Duration(milliseconds: 400), vsync: provider);
  Animation animation =
      Tween<double>(begin: 0.0, end: -pi / 8).animate(ctx.state.armController);
  if (ApplicationManager.sharedInstance().playerManager.player.state ==
      AudioPlayerState.PLAYING) {
    ctx.state.armController.reverse();
  }
  animation.addListener(() {
    ctx.dispatch(
        GlobalPlayerCentercoverActionCreator.onUpdateArmAngle(animation.value));
  });
}

void _onUpdatePlayingStatus(
    Action action, Context<GlobalPlayerCentercoverState> ctx) {
  bool isplaying = action.payload;
  if (isplaying) {
    ctx.state.armController.reverse();
    Future.delayed(Duration(milliseconds: 400), () {
      ctx.state.coverController.forward();
    });
  } else {
    ctx.state.armController.forward();
    ctx.state.coverController.stop();
  }
}

void _onHide(Action action, Context<GlobalPlayerCentercoverState> ctx) {
  ctx.state.hide != null
      ? ctx.state.hide()
      : ApplicationManager.logger
          .w("music cover hide action callback not implement");
}

void _onPause(Action action, Context<GlobalPlayerCentercoverState> ctx) {
  ctx.state.coverController.stop();
  ctx.state.armController.forward();
  ctx.state.couldSwipe = true;
}

void _onPlay(Action action, Context<GlobalPlayerCentercoverState> ctx) {
  ctx.state.coverController.forward();
  ctx.state.armController.reverse();
}

void _onSwiperIndexChanged(
    Action action, Context<GlobalPlayerCentercoverState> ctx) {
  if (ctx.state.couldSwipe == false) {
    return;
  }
  int value = action.payload;
  if (value > ctx.state.currentIndex) {
    ctx.dispatch(
        GlobalPlayerControlpadActionCreator.onPlayNext(animate: false));
    ctx.state.currentIndex = value;
  } else if (value < ctx.state.currentIndex) {
    ctx.dispatch(
        GlobalPlayerControlpadActionCreator.onPlayPrevious(animate: false));
    ctx.state.currentIndex = value;
  } else {
    // print("not move");
  }
}

void _onDispose(Action action, Context<GlobalPlayerCentercoverState> ctx) {
  ctx.state.coverController.dispose();
  ctx.state.armController.dispose();
  ctx.state.swiperController.dispose();
}
