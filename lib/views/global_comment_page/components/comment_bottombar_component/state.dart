import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class CommentBottombarState implements Cloneable<CommentBottombarState> {
  CommentBottombarState({this.song});

  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  FocusNode commentNode;
  final SongData song;
  TextEditingController controller = TextEditingController();
  @override
  CommentBottombarState clone() {
    return CommentBottombarState()
      ..commentNode = commentNode
      ..controller = controller;
  }
}
