import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/views/common/keys.dart';
import 'package:zmusic_flutter/views/common/mini_player_component/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TopBarComponent extends Component<TopBarState>
    with TickerProviderMixin<TopBarState> {
  TopBarComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<TopBarState>(
              adapter: null,
              slots: <String, Dependent<TopBarState>>{
                // CommonComponentKeys.Mini_Player_Key:
                //     MiniPlayerStateConnector() + MiniPlayerComponent()
              }),
        );
}
