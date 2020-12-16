import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/device_info.dart';

class CommentListItemState implements Cloneable<CommentListItemState> {
  CommentListItemState({this.commentModel, this.song});
  Comment commentModel;
  SongData song;
  AnimationController likeController;
  bool liked;
  int likedCount;
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;

  void resetModel(Comment model, bool liked, int likedCount) {
    this.commentModel = model;
    this.liked = liked;
    this.likedCount = likedCount;
  }

  @override
  CommentListItemState clone() {
    return CommentListItemState()
      ..liked = liked
      ..likeController = likeController
      ..commentModel = commentModel
      ..likedCount = likedCount
      ..song = song;
  }
}
