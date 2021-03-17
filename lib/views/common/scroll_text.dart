/*
 * @Description: 
 * @Author: zhangyf
 * @Date: 2020-12-16 15:30:54
 * @LastEditTime: 2020-12-22 09:10:48
 * @LastEditors: zhangyf
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CustomScrollTextComponent extends StatefulWidget {
  CustomScrollTextComponent(
      {Key key, this.title, this.titleColor, this.width, this.height})
      : super(key: key);

  final String title;
  final Color titleColor;
  final double width;
  final double height;
  @override
  _CustomScrollTextComponentState createState() =>
      _CustomScrollTextComponentState();
}

class _CustomScrollTextComponentState extends State<CustomScrollTextComponent> {
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () { 
      _controller.animateTo((_controller.position.maxScrollExtent - 50) / 2,
          duration: Duration(seconds: 10), curve: Curves.linear);
    });
    _controller.addListener(() {
      // if (_controller.offset >=
      //     (_controller.position.maxScrollExtent - 50) / 2)     {
      //   Future.delayed(Duration(seconds: 1), () {
      //     _controller.animateTo(_controller.position.maxScrollExtent,
      //         duration: Duration(seconds: 10), curve: Curves.linear);
      //   });
      // }
      // if (_controller.offset >= _controller.position.maxScrollExtent) {
      //   _controller.jumpTo((_controller.position.maxScrollExtent - 50) / 2);
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        child: Swiper(
          autoplay: true,
          autoplayDelay: 3000,
          itemCount: 2,
          duration: 10000,
          itemBuilder: (context, index) {
            return Text(widget.title);
          },
        ));
  }
}
