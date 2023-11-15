import 'package:flutter/material.dart';

class ButtonPressEffect extends StatefulWidget {
  const ButtonPressEffect({
    Key? key,
    required this.child,
    required this.onPress,
  }) : super(key: key);

  final Widget? child;
  final Function onPress;

  @override
  State<ButtonPressEffect> createState() => _ButtonPressEffectState();
}

class _ButtonPressEffectState extends State<ButtonPressEffect> {
  double opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        FocusScope.of(context).unfocus();
        // setState(() {
        //   opacity = 0.8;
        // });
      },
      onTapUp: (TapUpDetails details) {
        // setState(() {
        //   opacity = 1.0;
        // });
        widget.onPress();
      },
      child: Opacity(
        opacity: opacity,
        child: widget.child,
      ),
    );
  }
}
