import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentSongBannerComponent extends Component<CommentSongBannerState> {
  CommentSongBannerComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommentSongBannerState>(
                adapter: null,
                slots: <String, Dependent<CommentSongBannerState>>{
                }),);

}
