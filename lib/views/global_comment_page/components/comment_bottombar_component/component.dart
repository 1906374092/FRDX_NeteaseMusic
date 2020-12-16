import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentBottombarComponent extends Component<CommentBottombarState> {
  CommentBottombarComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommentBottombarState>(
                adapter: null,
                slots: <String, Dependent<CommentBottombarState>>{
                }),);

}
