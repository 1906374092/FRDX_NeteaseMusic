import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/utils/tools.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentListItemState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onLongPress: () {
      dispatch(CommentListItemActionCreator.onShowActionSheet());
    },
    child: Container(
      padding: EdgeInsets.all(10),
      width: state.deviceInfo.screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Container(
              width: 35,
              height: 35,
              child: CachedNetworkImage(
                imageUrl: state.commentModel.user.avatarUrl,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey[100]))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: state.deviceInfo.screenWidth - 60,
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                state.commentModel.user.nickname,
                                style: TextStyle(
                                    color: ColorDefine.Main_Subtitle_Text,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      Tools.getFullDateTimeString(
                                          state.commentModel.time.toInt()),
                                      style: TextStyle(
                                          color: ColorDefine.Light_grey_text,
                                          fontSize: 10),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      state.commentModel.tag == null ||
                                              state.commentModel.tag.datas ==
                                                  null
                                          ? ""
                                          : state
                                              .commentModel.tag.datas[0].text,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          state.likedCount.toString(),
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 12),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          dispatch(
                              CommentListItemActionCreator.onLike(state.liked));
                        },
                        child: ScaleTransition(
                          scale: state.likeController,
                          child: state.liked ?? false
                              ? Icon(
                                  XCIcons.like_hand_fill,
                                  color: ColorDefine.Login_BG,
                                  size: 20,
                                )
                              : Icon(
                                  XCIcons.like_hand,
                                  color: Colors.grey[500],
                                  size: 20,
                                ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  width: state.deviceInfo.screenWidth - 60,
                  child: Text(
                    state.commentModel.content,
                    maxLines: null,
                    style: TextStyle(
                        color: ColorDefine.Main_title_Text, fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    state.commentModel.showFloorComment == null ||
                            state.commentModel.showFloorComment.replyCount == 0
                        ? ""
                        : state.commentModel.showFloorComment.replyCount
                                .toString() +
                            "条回复>",
                    style: TextStyle(
                        color: ColorDefine.Button_Active_Text, fontSize: 15),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
