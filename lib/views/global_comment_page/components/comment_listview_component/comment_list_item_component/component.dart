import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentListItemComponent extends Component<CommentListItemState>
    with TickerProviderMixin {
  CommentListItemComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CommentListItemState>(
              adapter: null,
              slots: <String, Dependent<CommentListItemState>>{}),
        );
}
