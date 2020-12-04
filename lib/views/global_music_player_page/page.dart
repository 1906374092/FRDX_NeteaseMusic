import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_background_component/component.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_buttonsbar_component/component.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_centercover_component/component.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_controlpad_component/component.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_localplaylist_component/component.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_lyrics_component/component.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/global_player_topbar_component/component.dart';
import 'package:zmusic_flutter/views/global_music_player_page/components/keys.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GlobalMusicPlayerPage
    extends Page<GlobalMusicPlayerState, Map<String, dynamic>> {
  GlobalMusicPlayerPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<GlobalMusicPlayerState>(
              adapter: null,
              slots: <String, Dependent<GlobalMusicPlayerState>>{
                GlobalMusicPlayerPageKeys.Back_Component_Key:
                    BackGroundComponentConnector() +
                        GlobalPlayerBackgroundComponent(),
                GlobalMusicPlayerPageKeys.Topbar_Component_Key:
                    GlobalPlayerTopbarConnector() +
                        GlobalPlayerTopbarComponent(),
                GlobalMusicPlayerPageKeys.Centercover_Component_Key:
                    GlobalPlayerCentercoverConnector() +
                        GlobalPlayerCentercoverComponent(),
                GlobalMusicPlayerPageKeys.Buttonsbar_Component_Key:
                    GlobalPlayerButtonsbarConnector() +
                        GlobalPlayerButtonsbarComponent(),
                GlobalMusicPlayerPageKeys.Controlspad_Component_key:
                    GlobalPlayerControlpadConnector() +
                        GlobalPlayerControlpadComponent(),
                GlobalMusicPlayerPageKeys.Lyrics_Component_Key:
                    GlobalPlayerLyricsConnector() +
                        GlobalPlayerLyricsComponent(),
              }),
          middleware: <Middleware<GlobalMusicPlayerState>>[],
        );
}
