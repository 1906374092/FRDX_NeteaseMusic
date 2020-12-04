import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MineRootPage extends Page<MineRootState, Map<String, dynamic>> {
  MineRootPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MineRootState>(
                adapter: null,
                slots: <String, Dependent<MineRootState>>{
                }),
            middleware: <Middleware<MineRootState>>[
            ],);

}
