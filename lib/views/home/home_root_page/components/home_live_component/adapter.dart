/*
 * @Description: 
 * @Author: zhangyf
 * @Date: 2020-11-17 15:21:43
 * @LastEditTime: 2020-11-17 15:30:09
 * @LastEditors: zhangyf
 */
import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_live_component/components/home_live_item_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_live_component/state.dart';

class HomeLiveAdapter extends SourceFlowAdapter<HomeLiveState> {
  static const String item_style = "item_style";
  HomeLiveAdapter()
      : super(pool: <String, Component>{item_style: HomeLiveItemComponent()});
}
