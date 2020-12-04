import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VideoRootPage extends Page<VideoRootState, Map<String, dynamic>> {
  VideoRootPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VideoRootState>(
                adapter: null,
                slots: <String, Dependent<VideoRootState>>{
                }),
            middleware: <Middleware<VideoRootState>>[
            ],);

}
