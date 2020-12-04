import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CountrySelectComponent extends Component<CountrySelectState> {
  CountrySelectComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CountrySelectState>(
                adapter: null,
                slots: <String, Dependent<CountrySelectState>>{
                }),);

}
