import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentIndicatorBarComponent extends Component<CommentIndicatorBarState> {
  CommentIndicatorBarComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommentIndicatorBarState>(
                adapter: null,
                slots: <String, Dependent<CommentIndicatorBarState>>{
                }),);

}
