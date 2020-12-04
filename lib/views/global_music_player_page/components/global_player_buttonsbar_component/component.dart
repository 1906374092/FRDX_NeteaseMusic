import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GlobalPlayerButtonsbarComponent extends Component<GlobalPlayerButtonsbarState> {
  GlobalPlayerButtonsbarComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GlobalPlayerButtonsbarState>(
                adapter: null,
                slots: <String, Dependent<GlobalPlayerButtonsbarState>>{
                }),);

}
