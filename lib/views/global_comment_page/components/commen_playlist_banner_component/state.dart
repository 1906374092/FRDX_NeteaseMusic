import 'package:fish_redux/fish_redux.dart';

class CommenPlaylistBannerState implements Cloneable<CommenPlaylistBannerState> {

  @override
  CommenPlaylistBannerState clone() {
    return CommenPlaylistBannerState();
  }
}

CommenPlaylistBannerState initState(Map<String, dynamic> args) {
  return CommenPlaylistBannerState();
}
