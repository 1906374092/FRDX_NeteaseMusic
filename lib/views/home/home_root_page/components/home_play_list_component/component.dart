import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_play_list_component/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePlayListComponent extends Component<HomePlayListState> {
  HomePlayListComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomePlayListState>(
              adapter: NoneConn<HomePlayListState>() + HomePlayListAdapter(),
              slots: <String, Dependent<HomePlayListState>>{}),
        );
}
