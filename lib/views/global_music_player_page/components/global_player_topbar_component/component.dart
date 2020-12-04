import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GlobalPlayerTopbarComponent extends Component<GlobalPlayerTopbarState> {
  GlobalPlayerTopbarComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GlobalPlayerTopbarState>(
                adapter: null,
                slots: <String, Dependent<GlobalPlayerTopbarState>>{
                }),);

}
