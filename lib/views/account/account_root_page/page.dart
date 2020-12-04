import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AccountRootPage extends Page<AccountRootState, Map<String, dynamic>> {
  AccountRootPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AccountRootState>(
                adapter: null,
                slots: <String, Dependent<AccountRootState>>{
                }),
            middleware: <Middleware<AccountRootState>>[
            ],);

}
