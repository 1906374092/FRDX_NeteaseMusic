import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_chinese_song_component/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeChineseSongComponent extends Component<HomeChineseSongState> {
  HomeChineseSongComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeChineseSongState>(
              adapter: NoneConn<HomeChineseSongState>() + MiniSongListAdapter(),
              slots: <String, Dependent<HomeChineseSongState>>{}),
        );
}
