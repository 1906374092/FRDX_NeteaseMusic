import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GlobalPlayerLocalplaylistComponent extends Component<GlobalPlayerLocalplaylistState> {
  GlobalPlayerLocalplaylistComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GlobalPlayerLocalplaylistState>(
                adapter: null,
                slots: <String, Dependent<GlobalPlayerLocalplaylistState>>{
                }),);

}
