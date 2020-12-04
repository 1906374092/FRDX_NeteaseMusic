import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(DragonballComponentState state, Dispatch dispatch,
    ViewService viewService) {
  return Container(
    margin: EdgeInsets.only(left: 5, right: 5),
    width: state.deviceInfo.screenWidth,
    height: 80,
    child: ListView.builder(
        itemCount: viewService.buildAdapter().itemCount,
        itemExtent: 70,
        scrollDirection: Axis.horizontal,
        itemBuilder: viewService.buildAdapter().itemBuilder),
  );
}
