import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MiniPlayerComponent extends Component<MiniPlayerState>
    with TickerProviderMixin<MiniPlayerState> {
  MiniPlayerComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MiniPlayerState>(
              adapter: null, slots: <String, Dependent<MiniPlayerState>>{}),
        );
}
