import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:zmusic_flutter/utils/colors.dart';
import 'package:zmusic_flutter/views/login/login_page/action.dart';

import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: ColorDefine.Login_BG,
    child: KeyboardAvoider(
      autoScroll: true,
      child: GestureDetector(
        onTap: () {
          dispatch(LoginActionCreator.onHidekeyboard());
        },
        child: Container(
          width: state.deviceInfo.screenWidth,
          height: state.deviceInfo.screenHeight,
          color: ColorDefine.Login_BG,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: state.deviceInfo.naviBarHeight),
                  width: state.deviceInfo.screenWidth,
                  height: state.deviceInfo.screenWidth,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SpinKitRipple(
                        borderWidth: 1,
                        color: ColorDefine.Inactive_Grey,
                        size: state.deviceInfo.screenWidth * 0.8,
                        controller: state.controller,
                      ),
                      ClipOval(
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.orange,
                          child: Image(
                            image: AssetImage("images/login/logo.png"),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                width: state.deviceInfo.screenWidth,
                // height: state.deviceInfo.screenHeight -
                //     state.deviceInfo.naviBarHeight -
                //     state.deviceInfo.screenWidth,
                // color: ColorDefine.Main_Red,
                child: Column(
                  children: [
                    Container(
                      width: state.deviceInfo.screenWidth - 50 * 2,
                      height: 40,
                      child: CupertinoTextField(
                        controller: state.phoneController,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        keyboardType: TextInputType.number,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        focusNode: state.phoneNode,
                        decoration: BoxDecoration(
                            color: ColorDefine.Login_BG,
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFababab)))),
                        placeholder: "请输入手机号",
                        placeholderStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      width: state.deviceInfo.screenWidth - 50 * 2,
                      height: 40,
                      child: CupertinoTextField(
                        controller: state.passwordController,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        obscureText: true,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        focusNode: state.passwordNode,
                        decoration: BoxDecoration(
                            color: ColorDefine.Login_BG,
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFababab)))),
                        placeholder: "请输入密码",
                        placeholderStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        dispatch(LoginActionCreator.onLoginTap());
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 40),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        width: state.deviceInfo.screenWidth - 50 * 2,
                        height: 50,
                        child: Text(
                          "立即体验",
                          style: TextStyle(
                              color: ColorDefine.Login_BG,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
