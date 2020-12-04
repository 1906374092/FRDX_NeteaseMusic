import 'package:fish_redux/fish_redux.dart';
import 'package:zmusic_flutter/views/common/common_button_component/component.dart';
import 'package:zmusic_flutter/views/home/home_root_page/components/dragonball_component_component/state.dart';

class DragonballAdapter extends SourceFlowAdapter<DragonballComponentState> {
  static const String item_style = "project_tab_item";

  DragonballAdapter()
      : super(
          pool: <String, Component<Object>>{
            ///定义item的样式
            item_style: CommonButtonComponent(),
          },
        );
}
