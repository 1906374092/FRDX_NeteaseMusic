import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/common/common_progressbar_component/component.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_localplaylist_component/component.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/keys.dart';
import 'package:zmusic_flutter/views/common/keys.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GlobalPlayerControlpadComponent
    extends Component<GlobalPlayerControlpadState> {
  GlobalPlayerControlpadComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<GlobalPlayerControlpadState>(
              adapter: null,
              slots: <String, Dependent<GlobalPlayerControlpadState>>{
                CommonComponentKeys.Common_Progressbar_Key:
                    CommonProgressbarConnector() + CommonProgressbarComponent(),
                GlobalMusicPlayerPageKeys.Local_Play_List_Key:
                    GlobalPlayerLocalplaylistConnector() +
                        GlobalPlayerLocalplaylistComponent()
              }),
        );
}
