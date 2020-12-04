import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/utils/placeholder.dart';
import 'package:zmusic_flutter/views/common/swiper_component/action.dart';

import 'state.dart';

Widget buildView(
    SwiperState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth,
    height: 160,
    alignment: Alignment.center,
    child: Container(
      width: state.deviceInfo.screenWidth - 15 * 2,
      height: 134 / 345 * (state.deviceInfo.screenWidth - 15 * 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Swiper(
          onTap: (index) {
            dispatch(
                SwiperActionCreator.onItemTap(state.banners.banners[index]));
          },
          curve: Curves.linear,
          itemCount: state.banners != null ? state.banners.banners.length : 1,
          itemWidth: state.deviceInfo.screenWidth - 15 * 2,
          itemHeight: 100,
          autoplay: true,
          autoplayDelay: 5000,
          fade: 0,
          itemBuilder: (context, index) {
            if (state.banners == null) {
              return Container();
            } else {
              return Container(
                width: state.deviceInfo.screenWidth - 15 * 2,
                height: 134 / 345 * (state.deviceInfo.screenWidth - 15 * 2),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: state.banners.banners[index].pic,
                      placeholder: (context, url) => Container(
                        width: state.deviceInfo.screenWidth - 15 * 2,
                        height:
                            134 / 345 * (state.deviceInfo.screenWidth - 15 * 2),
                        color: ColorDefine.Inactive_Grey,
                      ),
                      errorWidget: (context, url, error) =>
                          PlaceholderDefine.commonImagePlaceholder,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        child: Container(
                          color:
                              state.banners.banners[index].titleColor == "red"
                                  ? ColorDefine.Main_Red
                                  : ColorDefine.Main_Blue,
                          padding: EdgeInsets.only(
                              top: 3, bottom: 3, left: 5, right: 5),
                          child: Text(
                            state.banners.banners[index].typeTitle,
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          },
          pagination: SwiperCustomPagination(
            builder: (context, config) {
              if (state.banners != null) {
                List<Widget> items = List();
                for (var i = 0; i != state.banners.banners.length; ++i) {
                  items.add(Container(
                    width: 6,
                    height: 6,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: i == config.activeIndex
                            ? ColorDefine.Main_Red
                            : ColorDefine.Inactive_Grey,
                        borderRadius: BorderRadius.circular(3)),
                  ));
                }
                return Container(
                  width: state.deviceInfo.screenWidth,
                  height: 10,
                  margin: EdgeInsets.only(top: 118),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: items,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    ),
  );
}
