/*
 * @Description: 
 * @Author: zhangyf
 * @Date: 2020-12-08 09:40:11
 * @LastEditTime: 2020-12-10 13:51:13
 * @LastEditors: zhangyf
 */
import 'package:flutter/material.dart';
import 'package:zmusic_flutter/utils/colors.dart';

class CustomSegment extends StatefulWidget {
  CustomSegment(
      {@required this.segments, this.onIndexChanged, this.activeIndex = 0});
  final List<String> segments;
  final Function(int index) onIndexChanged;
  int activeIndex;
  @override
  State<StatefulWidget> createState() {
    return _CustomSegmentState();
  }
}

class _CustomSegmentState extends State<CustomSegment> {
  List<Widget> getSegments() {
    List<Widget> children = List.generate(widget.segments.length, (index) {
      return GestureDetector(
        onTap: () {
          this.setState(() {
            widget.activeIndex = index;
          });
          if (widget.onIndexChanged != null) {
            widget.onIndexChanged(index);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color:
                          index == 0 ? Colors.white : ColorDefine.Inactive_Grey,
                      width: 1))),
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Text(
            widget.segments[index],
            style: index == widget.activeIndex
                ? TextStyle(
                    color: ColorDefine.Main_title_Text,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)
                : TextStyle(
                    color: ColorDefine.Main_Subtitle_Text, fontSize: 13),
          ),
        ),
      );
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: getSegments()),
    );
  }
}
