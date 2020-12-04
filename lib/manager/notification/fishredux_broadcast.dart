/*
 * @Description: 
 * @Author: zhangyf
 * @Date: 2020-11-18 16:35:03
 * @LastEditTime: 2020-11-19 18:47:16
 * @LastEditors: zhangyf
 */
import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/notification/event_bus.dart';

enum BroadcastAction { playSongAction }

class BroadcastActionCreator {
  static Action onPlaySongAction(String songId) {
    return Action(BroadcastAction.playSongAction, payload: songId);
  }
}
