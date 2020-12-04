import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class MiniPlayerState implements Cloneable<MiniPlayerState> {
  AnimationController coverRotateAnimationController;
  double musicPosition = 0;
  @override
  MiniPlayerState clone() {
    return MiniPlayerState()
      ..coverRotateAnimationController = coverRotateAnimationController
      ..musicPosition = musicPosition;
  }
}

MiniPlayerState initState(Map<String, dynamic> args) {
  return MiniPlayerState();
}
