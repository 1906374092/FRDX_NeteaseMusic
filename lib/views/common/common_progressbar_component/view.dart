import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:flutter_seekbar/seekbar/seekbar.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    CommonProgressbarState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    width: state.deviceInfo.screenWidth,
    padding: EdgeInsets.only(left: 15, right: 15),
    height: 30,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 30,
          child: Text(
            state.progressTimeText,
            style: TextStyle(color: state.progressTimeColor, fontSize: 9),
          ),
        ),
        Spacer(),
        Container(
            height: 20,
            width: state.deviceInfo.screenWidth - 60 - 30 - 10,
            child: SeekBar(
              backgroundColor: Colors.white.withOpacity(0.1),
              indicatorColor: Colors.white,
              progressColor: Colors.white.withOpacity(0.3),
              indicatorRadius: state.indicatorRadius,
              min: 0,
              max: state.max,
              value: state.value,
              progresseight: state.barHeight,
              onValueChanged: (value) {
                dispatch(CommonProgressbarActionCreator.onValueChanged(value));
              },
              onTapStart: () {
                dispatch(CommonProgressbarActionCreator.onTapStartAction());
              },
              onTapEnd: () {
                dispatch(CommonProgressbarActionCreator.onTapEnd());
              },
            )),
        Spacer(),
        Container(
          width: 30,
          alignment: Alignment.center,
          child: Text(
            state.totalTimeText,
            style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 9),
          ),
        )
      ],
    ),
  );
}
