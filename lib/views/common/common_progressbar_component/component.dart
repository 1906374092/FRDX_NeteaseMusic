import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommonProgressbarComponent extends Component<CommonProgressbarState>
    with TickerProviderMixin {
  CommonProgressbarComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CommonProgressbarState>(
              adapter: null,
              slots: <String, Dependent<CommonProgressbarState>>{}),
        );
}
