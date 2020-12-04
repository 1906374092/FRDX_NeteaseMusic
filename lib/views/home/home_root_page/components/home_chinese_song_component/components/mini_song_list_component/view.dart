import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';
import 'package:zmusic_flutter/utils/placeholder.dart';
import 'package:zmusic_flutter/utils/tools.dart';
import 'package:zmusic_flutter/views/common/effect_button_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MiniSongListState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth - 15,
    height: 300,
    // color: Colors.blue,
    margin: EdgeInsets.all(5),
    child: Container(
      width: state.deviceInfo.screenWidth - 25,
      height: 230,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        itemExtent: 75,
        itemCount: state.creative.resources.length,
        itemBuilder: (context, index) {
          Resource resource = state.creative.resources[index];
          GlobalKey imageKey = GlobalKey();
          if (state.creative == null) {
            return Container();
          }
          return EffectButton(
            onTaped: () {
              Tools.setButtonLock(() {
                if (resource.resourceId == state.playingSongId) {
                  dispatch(MiniSongListActionCreator.onJumpToPlayer(resource));
                } else {
                  dispatch(MiniSongListActionCreator.onPlayAction(
                      {"resource": resource, "imageKey": imageKey}));
                }
              });
            },
            child: Container(
              width: state.deviceInfo.screenWidth - 25,
              height: 75,
              // color: Colors.blue,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      key: imageKey,
                      width: 60,
                      height: 60,
                      child: CachedNetworkImage(
                        imageUrl: resource.uiElement.image.imageUrl,
                        placeholder: (context, url) =>
                            PlaceholderDefine.commonImagePlaceholder,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 9,
                    child: Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        0.4 * state.deviceInfo.screenWidth),
                                child: Text(
                                  resource.uiElement.mainTitle.title,
                                  style: TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        0.15 * state.deviceInfo.screenWidth),
                                child: Text(
                                  " - " +
                                      resource.resourceExtInfo.artists[0].name,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: ColorDefine.Light_grey_text),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          Builder(
                            builder: (context) {
                              if (resource.uiElement.subTitle != null) {
                                return Text(
                                  resource.uiElement.subTitle.title,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: ColorDefine.Light_grey_text),
                                );
                              } else {
                                return Container();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  // Spacer(),
                  Flexible(
                      flex: 1,
                      child: resource.resourceId == state.playingSongId
                          ? Container(
                              width: 26,
                              height: 26,
                              child: Icon(
                                XCIcons.sound,
                                color: ColorDefine.Main_widget_red,
                                size: 20,
                              ),
                            )
                          : Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(
                                      width: 1,
                                      color: ColorDefine.Inactive_Grey)),
                              child: Icon(
                                Icons.play_arrow,
                                color: ColorDefine.Main_widget_red,
                                size: 18,
                              ),
                            )),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
