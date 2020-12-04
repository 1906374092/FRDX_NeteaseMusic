import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlayListItemButtonComponent extends Component<PlayListItemButtonState> {
  PlayListItemButtonComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlayListItemButtonState>(
                adapter: null,
                slots: <String, Dependent<PlayListItemButtonState>>{
                }),);

}
