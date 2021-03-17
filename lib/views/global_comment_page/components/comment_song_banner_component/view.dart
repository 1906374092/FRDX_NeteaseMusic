import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';

import 'state.dart';

Widget buildView(
    CommentSongBannerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.all(10),
    width: state.deviceInfo.screenWidth,
    height: 130,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 10),
          child: Row(
            children: [
              Container(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                          width: 60,
                          height: 60,
                          child: CachedNetworkImage(
                              imageUrl:
                                  state.playerManager.sonngData.album.picUrl)),
                    ),
                    Positioned(
                      right: 3,
                      bottom: 3,
                      child: ClipOval(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: ColorDefine.Login_BG,
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        state.playerManager.sonngData.name,
                        style: TextStyle(
                            color: ColorDefine.Main_title_Text, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        state.playerManager.sonngData.artists[0].name,
                        style: TextStyle(
                            color: ColorDefine.Button_Active_Text,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorDefine.Light_grey_text,
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[100],
        ),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Icon(
                XCIcons.cloud_circle,
                color: Color.fromARGB(255, 116, 154, 190),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "${state.playerManager.sonngData.artists[0].name}的云圈",
                  style: TextStyle(
                      color: ColorDefine.Main_title_Text, fontSize: 14),
                ),
              ),
              Spacer(),
              Container(
                child: Text(
                  "8万圈友已加入",
                  style: TextStyle(
                      color: ColorDefine.Main_Subtitle_Text, fontSize: 12),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorDefine.Light_grey_text,
                size: 15,
              )
            ],
          ),
        ),
      ],
    ),
  );
}
