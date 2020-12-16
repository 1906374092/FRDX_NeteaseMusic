import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/views/common/segment.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/comment_listview_component/action.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(CommentIndicatorBarState state, Dispatch dispatch,
    ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth,
    height: 40,
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Container(
          child: Text(
            "评论区",
            style: TextStyle(color: ColorDefine.Main_title_Text, fontSize: 15),
          ),
        ),
        Spacer(),
        CustomSegment(
          activeIndex: state.activeIndex,
          segments: ["推荐", "最热", "最新"],
          onIndexChanged: (index) {
            dispatch(CommentListviewActionCreator.onChangeSort(index + 1));
            dispatch(
                CommentIndicatorBarActionCreator.onUpdateActiveIndex(index));
          },
        )
      ],
    ),
  );
}
