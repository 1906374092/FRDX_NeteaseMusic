import 'package:fish_redux/fish_redux.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MiniSongListComponent extends Component<MiniSongListState>
    with TickerProviderMixin {
  MiniSongListComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MiniSongListState>(
              adapter: null, slots: <String, Dependent<MiniSongListState>>{}),
        );
}
