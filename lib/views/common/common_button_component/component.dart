import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommonButtonComponent extends Component<CommonButtonState> {
  CommonButtonComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommonButtonState>(
                adapter: null,
                slots: <String, Dependent<CommonButtonState>>{
                }),);

}
