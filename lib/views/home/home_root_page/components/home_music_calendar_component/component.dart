import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeMusicCalendarComponent extends Component<HomeMusicCalendarState>
    with SingleTickerProviderMixin<HomeMusicCalendarState> {
  HomeMusicCalendarComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeMusicCalendarState>(
              adapter: null,
              slots: <String, Dependent<HomeMusicCalendarState>>{}),
        );
}
