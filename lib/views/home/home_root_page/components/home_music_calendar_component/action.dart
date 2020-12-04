import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/models/index.dart';

//TODO replace with your own action
enum HomeMusicCalendarAction { changeIndex, setAnimation, getData }

class HomeMusicCalendarActionCreator {
  static Action changeIndex(int index) {
    return Action(HomeMusicCalendarAction.changeIndex, payload: index);
  }

  static Action onSetAnimation(Animation animation) {
    return Action(HomeMusicCalendarAction.setAnimation, payload: animation);
  }

  static Action onGetData() {
    return const Action(HomeMusicCalendarAction.getData);
  }
}
