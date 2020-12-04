import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/common/play_list_item_button_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_play_list_component/state.dart';

class HomePlayListAdapter extends SourceFlowAdapter<HomePlayListState> {
  static const String item_style = "play_list_item_button";

  HomePlayListAdapter()
      : super(
          pool: <String, Component<Object>>{
            ///定义item的样式
            item_style: PlayListItemButtonComponent(),
          },
        );
}
