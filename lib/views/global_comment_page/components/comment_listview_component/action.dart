import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/comment_list_item_component/state.dart';

enum CommentListviewAction {
  action,
  updateData,
  changeSort,
  getIndicatorBar,
  loadData,
  addItem,
}

class CommentListviewActionCreator {
  static Action onAction() {
    return const Action(CommentListviewAction.action);
  }

  static Action onUpdateData(List<CommentListItemState> data) {
    return Action(CommentListviewAction.updateData, payload: data);
  }

  ///1:按推荐排序,2:按热度排序,3:按时间排序
  static Action onChangeSort(int sortType) {
    return Action(CommentListviewAction.changeSort, payload: sortType);
  }

  static Action onGetIndicatorBar(Widget bar) {
    return Action(CommentListviewAction.getIndicatorBar, payload: bar);
  }

  static Action onLoadData() {
    return const Action(CommentListviewAction.loadData);
  }

  static Action onAddItem(Comment comment) {
    return Action(CommentListviewAction.addItem, payload: comment);
  }
}
