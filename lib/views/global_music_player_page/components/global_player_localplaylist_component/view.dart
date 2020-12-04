import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/models/index.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/iconfont.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GlobalPlayerLocalplaylistState state, Dispatch dispatch,
    ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth - 30,
    height: state.deviceInfo.screenHeight * 0.6,
    margin: EdgeInsets.only(bottom: state.deviceInfo.bottomSafeArea + 5),
    padding: EdgeInsets.only(left: 10, right: 10, top: 15),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: "当前播放",
              style: TextStyle(
                  color: ColorDefine.Main_title_Text,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: "（${state.localPlayList.length ?? 0}）",
              style: TextStyle(
                color: ColorDefine.Main_Subtitle_Text,
                fontSize: 15,
              ),
            )
          ])),
        ),
        Container(
          child: Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.all(2),
                onPressed: () {
                  dispatch(GlobalPlayerLocalplaylistActionCreator
                      .onChangePlayOption());
                },
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          state.playListOptionIcon,
                          color: ColorDefine.Main_title_Text,
                          size: 20,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          state.playListOptionText,
                          style: TextStyle(
                              color: ColorDefine.Main_Subtitle_Text,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              CupertinoButton(
                onPressed: () {},
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          XCIcons.add_favorite,
                          color: ColorDefine.Light_grey_text,
                          size: 20,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          "收藏全部",
                          style: TextStyle(
                              color: ColorDefine.Main_Subtitle_Text,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 20,
                color: Colors.grey[200],
              ),
              CupertinoButton(
                onPressed: () {
                  dispatch(
                      GlobalPlayerLocalplaylistActionCreator.onDeleteAll());
                },
                child: Icon(
                  XCIcons.delete,
                  color: ColorDefine.Light_grey_text,
                  size: 20,
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: state.deviceInfo.screenHeight * 0.6 - 160,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[100],
              );
            },
            padding: EdgeInsets.only(top: 0, bottom: 0),
            itemCount:
                state.localPlayList == null ? 1 : state.localPlayList.length,
            itemBuilder: (context, index) {
              if (state.localPlayList == null) {
                return Container();
              }
              SongData data = state.localPlayList[index];
              String songId =
                  ApplicationManager.sharedInstance().playerManager.songId;
              return GestureDetector(
                onTap: () {
                  dispatch(
                      GlobalPlayerLocalplaylistActionCreator.onTapItem(data));
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Offstage(
                        offstage: songId != data.id.toString(),
                        child: Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            XCIcons.sound,
                            color: ColorDefine.Login_BG,
                            size: 20,
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: state.deviceInfo.screenWidth / 2),
                        child: Text(
                          data.name,
                          style: TextStyle(
                              color: songId == data.id.toString()
                                  ? ColorDefine.Login_BG
                                  : ColorDefine.Main_title_Text,
                              fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        child: Text(
                          "-${data.artists[0].name}",
                          style: TextStyle(
                              color: songId == data.id.toString()
                                  ? ColorDefine.Login_BG
                                  : ColorDefine.Main_title_Text,
                              fontSize: 12),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          dispatch(GlobalPlayerLocalplaylistActionCreator
                              .onDeleteItem(data));
                        },
                        child: Container(
                          child: Icon(
                            Icons.close_sharp,
                            color: ColorDefine.Inactive_Grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            dispatch(GlobalPlayerLocalplaylistActionCreator.onClose());
          },
          child: Container(
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(width: 1, color: Colors.grey[50]))),
            child: Text(
              "关闭",
              style: TextStyle(
                  color: ColorDefine.Button_Default_Title, fontSize: 18),
            ),
          ),
        )
      ],
    ),
  );
}
