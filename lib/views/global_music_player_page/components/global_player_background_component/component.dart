import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GlobalPlayerBackgroundComponent
    extends Component<GlobalPlayerBackgroundState> {
  GlobalPlayerBackgroundComponent()
      : super(
          effect: null,
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<GlobalPlayerBackgroundState>(
              adapter: null,
              slots: <String, Dependent<GlobalPlayerBackgroundState>>{}),
        );
}
