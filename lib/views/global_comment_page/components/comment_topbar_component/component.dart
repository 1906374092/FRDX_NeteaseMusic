import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentTopbarComponent extends Component<CommentTopbarState> {
  CommentTopbarComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommentTopbarState>(
                adapter: null,
                slots: <String, Dependent<CommentTopbarState>>{
                }),);

}
