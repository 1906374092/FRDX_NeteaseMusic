import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CountryRootPage extends Page<CountryRootState, Map<String, dynamic>> {
  CountryRootPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CountryRootState>(
                adapter: null,
                slots: <String, Dependent<CountryRootState>>{
                }),
            middleware: <Middleware<CountryRootState>>[
            ],);

}
