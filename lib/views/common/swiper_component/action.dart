import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/models/banners.dart';
import 'package:zmusic_flutter/models/index.dart';

enum SwiperAction { action, init, getBanner, itemTap }

class SwiperActionCreator {
  static Action onAction() {
    return const Action(SwiperAction.action);
  }

  static Action onInit() {
    return const Action(SwiperAction.init);
  }

  static Action onGetBanner(Banners banners) {
    return Action(SwiperAction.getBanner, payload: banners);
  }

  static Action onItemTap(Banner_item item) {
    return Action(SwiperAction.itemTap, payload: item);
  }
}
