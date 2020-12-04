import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GlobalPlayerLyricsComponent extends Component<GlobalPlayerLyricsState> {
  GlobalPlayerLyricsComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<GlobalPlayerLyricsState>(
              adapter: null,
              slots: <String, Dependent<GlobalPlayerLyricsState>>{}),
        );
}
