import 'package:fish_redux/fish_redux.dart';

class VideoRootState implements Cloneable<VideoRootState> {

  @override
  VideoRootState clone() {
    return VideoRootState();
  }
}

VideoRootState initState(Map<String, dynamic> args) {
  return VideoRootState();
}
