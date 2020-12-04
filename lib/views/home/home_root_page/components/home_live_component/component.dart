import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/home_live_component/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeLiveComponent extends Component<HomeLiveState> {
  HomeLiveComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeLiveState>(
              adapter: NoneConn<HomeLiveState>() + HomeLiveAdapter(),
              slots: <String, Dependent<HomeLiveState>>{}),
        );
}
