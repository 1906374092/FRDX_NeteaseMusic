import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef Ontaped = Function();

class EffectButton extends StatefulWidget {
  EffectButton({Key key, this.child, this.onTaped}) : super(key: key);
  final Ontaped onTaped;
  final Widget child;
  @override
  _EffectButtonState createState() => _EffectButtonState();
}

class _EffectButtonState extends State<EffectButton> {
  double _padding = 0;
  double _opacity = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        this.setState(() {
          _padding = 3;
          _opacity = 0.2;
        });
      },
      onTapUp: (details) {
        this.setState(() {
          _padding = 0;
          _opacity = 0;
        });
      },
      onTap: widget.onTaped,
      child: AnimatedContainer(
        padding: EdgeInsets.all(_padding),
        child: Stack(
          children: [
            widget.child,
            AnimatedContainer(
                duration: Duration(milliseconds: 80),
                color: Colors.white.withOpacity(_opacity)),
          ],
        ),
        duration: Duration(milliseconds: 50),
      ),
    );
  }
}
