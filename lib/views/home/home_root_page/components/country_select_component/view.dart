import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CountrySelectState state, Dispatch dispatch, ViewService viewService) {
  if (state.block == null) {
    return Container();
  }
  return Container(
    width: state.deviceInfo.screenWidth,
    height: 300,
    color: Colors.blue,
    child: Column(
      children: [
        Container(
          child: Text(state.block.uiElement.mainTitle.title),
        )
      ],
    ),
  );
}
