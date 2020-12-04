import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeLiveItemComponent extends Component<HomeLiveItemState> {
  HomeLiveItemComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeLiveItemState>(
                adapter: null,
                slots: <String, Dependent<HomeLiveItemState>>{
                }),);

}
