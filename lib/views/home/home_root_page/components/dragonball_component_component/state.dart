import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/manager/application_manager.dart';
import 'package:zmusic_flutter/utils/device_info.dart';
import 'package:zmusic_flutter/views/common/common_button_component/state.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/dragonball_component_component/adapter.dart';

class DragonballComponentState extends MutableSource
    implements Cloneable<DragonballComponentState> {
  List<CommonButtonState> dragonballs;
  DeviceInfo get deviceInfo => ApplicationManager.sharedInstance().deviceInfo;
  @override
  Object getItemData(int index) {
    return dragonballs == null ? null : dragonballs[index];
  }

  @override
  String getItemType(int index) {
    return DragonballAdapter.item_style;
  }

  @override
  int get itemCount => dragonballs == null ? 1 : dragonballs.length;

  @override
  void setItemData(int index, Object data) {
    dragonballs[index] = data;
  }

  @override
  DragonballComponentState clone() {
    return DragonballComponentState()..dragonballs = dragonballs;
  }
}
