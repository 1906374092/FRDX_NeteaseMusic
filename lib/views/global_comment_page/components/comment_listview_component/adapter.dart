/*
 * @Description: 
 * @Author: zhangyf
 * @Date: 2020-12-08 16:37:26
 * @LastEditTime: 2021-03-17 14:46:50
 * @LastEditors: zhangyf
 */
import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/comment_list_item_component/component.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/state.dart';

class CommentListviewAdapter extends SourceFlowAdapter<CommentListviewState> {
  static const String item_style = "item_style";
  CommentListviewAdapter()
      : super(pool: <String, Component>{
          item_style: CommentListItemComponent(),
        });
}
