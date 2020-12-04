import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/dragonball_component_component/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DragonballComponentComponent extends Component<DragonballComponentState> {
  DragonballComponentComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<DragonballComponentState>(
              adapter:
                  NoneConn<DragonballComponentState>() + DragonballAdapter(),
              slots: <String, Dependent<DragonballComponentState>>{}),
        );
}
