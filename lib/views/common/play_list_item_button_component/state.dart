import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/index.dart';

class PlayListItemButtonState implements Cloneable<PlayListItemButtonState> {
  PlayListItemButtonState({this.creative});
  Creative creative;
  @override
  PlayListItemButtonState clone() {
    return PlayListItemButtonState()..creative = creative;
  }
}
