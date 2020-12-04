import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/components/mini_song_list_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/state.dart';

class MiniSongListAdapter extends SourceFlowAdapter<HomeChineseSongState> {
  static const String item_style = "MiniSongItemStyle";
  MiniSongListAdapter()
      : super(
          pool: <String, Component<Object>>{
            ///定义item的样式
            item_style: MiniSongListComponent(),
          },
        );
}
