import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/views/common/effect_button_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeLiveItemState state, Dispatch dispatch, ViewService viewService) {
  if (state.extInfo == null) {
    return Container();
  }
  return Container(
    padding: EdgeInsets.only(top: 5, left: 5, right: 5),
    width: 50,
    child: EffectButton(
      onTaped: () {
        print(1);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                    child: CachedNetworkImage(
                  imageUrl: state.extInfo.verticalCover,
                  placeholder: (context, url) {
                    return Container(
                      color: ColorDefine.Main_Light_Grey,
                    );
                  },
                )),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 3, right: 6, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8))),
                  child: Row(
                    children: [
                      Icon(
                        XCIcons.fire,
                        color: Colors.red,
                        size: 15,
                      ),
                      Text(
                        state.extInfo.popularity.toString() +
                            "•" +
                            state.extInfo.privateTag,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            child: Text(state.extInfo.title,
                maxLines: 2,
                style:
                    TextStyle(color: ColorDefine.Main_title_Text, fontSize: 12),
                overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    ),
  );
}
