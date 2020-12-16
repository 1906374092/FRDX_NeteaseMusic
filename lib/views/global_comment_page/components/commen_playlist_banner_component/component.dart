import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommenPlaylistBannerComponent extends Component<CommenPlaylistBannerState> {
  CommenPlaylistBannerComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommenPlaylistBannerState>(
                adapter: null,
                slots: <String, Dependent<CommenPlaylistBannerState>>{
                }),);

}
