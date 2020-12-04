import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GlobalPlayerCentercoverComponent
    extends Component<GlobalPlayerCentercoverState> with TickerProviderMixin {
  GlobalPlayerCentercoverComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<GlobalPlayerCentercoverState>(
              adapter: null,
              slots: <String, Dependent<GlobalPlayerCentercoverState>>{}),
        );
}
