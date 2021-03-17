import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WebviewTopbarComponent extends Component<WebviewTopbarState> {
  WebviewTopbarComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WebviewTopbarState>(
                adapter: null,
                slots: <String, Dependent<WebviewTopbarState>>{
                }),);

}
