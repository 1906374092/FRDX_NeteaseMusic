import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zmusic_flutter/views/common/page_util.dart';
import 'package:zmusic_flutter/views/common/refresh_component.dart';
import 'package:zmusic_flutter/views/global_comment_page/components/keys.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentListviewState state, Dispatch dispatch, ViewService viewService) {
  if (state.items == null) {
    return PageUtil.pageLoadingPlaceholder();
  }
  return Container(
    width: state.deviceInfo.screenWidth,
    height: state.deviceInfo.screenHeight -
        state.deviceInfo.naviBarHeight -
        40 -
        state.deviceInfo.bottomSafeArea -
        16,
    // color: Colors.orange,
    child: SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      controller: state.refreshController,
      footer: RefreshComponent.loadingMoreFooter(),
      onLoading: () {
        dispatch(CommentListviewActionCreator.onLoadData());
      },
      child: CustomScrollView(
        controller: state.controller,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                viewService
                    .buildComponent(GlobalCommentComponentKeys.Song_Banner_Key),
                Container(
                  width: state.deviceInfo.screenWidth,
                  height: 8,
                  color: Colors.grey[100],
                ),
                viewService.buildComponent(
                    GlobalCommentComponentKeys.Indicator_Bar_Key)
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                viewService.buildAdapter().itemBuilder,
                childCount: viewService.buildAdapter().itemCount),
          )
        ],
      ),
    ),
  );
}
