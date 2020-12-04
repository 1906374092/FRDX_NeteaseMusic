import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/utils/tools.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PlayListItemButtonState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.only(top: 5, left: 5, right: 5),
    width: 50,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                  child: CachedNetworkImage(
                imageUrl: state.creative.uiElement.image.imageUrl,
                placeholder: (context, url) {
                  return Container(
                    color: ColorDefine.Main_Light_Grey,
                  );
                },
              )),
            ),
            Positioned(
              top: 3,
              right: 5,
              child: Row(
                children: [
                  Icon(
                    XCIcons.mini_play,
                    color: Colors.white,
                    size: 12,
                  ),
                  Container(
                    child: Text(
                      (Tools.getNumberLabel(state
                          .creative.resources[0].resourceExtInfo.playCount)),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          child: Text(state.creative.uiElement.mainTitle.title,
              maxLines: 2,
              style:
                  TextStyle(color: ColorDefine.Main_title_Text, fontSize: 12),
              overflow: TextOverflow.ellipsis),
        )
      ],
    ),
  );
}
