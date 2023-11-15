import 'package:flutter/material.dart';
import 'package:we_chat/presentation/widget/button_press_effect.dart';

class CustomButton extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  final Color? backgroundColor;
  final Color? gradient1;
  final Color? gradient2;
  final double? width;
  final dynamic height;
  final double? borderRadius;
  final Color? borderColor;
  final Function onPress;
  final TextAlign? textAlign;
  final double? borderWidth;

  const CustomButton({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius,
    required this.onPress,
    this.textAlign,
    this.textStyle,
    this.gradient1,
    this.gradient2,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = height ?? 40.0;

    return ButtonPressEffect(
      onPress: () {
        FocusScope.of(context).unfocus();
        Future.delayed(const Duration(microseconds: 100), (() => onPress()));
      },
      child: Container(
        height: h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          gradient: gradient1 != null
              ? LinearGradient(colors: [
                  gradient1!,
                  gradient2!,
                ])
              : null,
          borderRadius: BorderRadius.circular(
            borderRadius ?? h / 2,
          ),
          border: borderColor != null
              ? Border.all(color: Colors.white, width: borderWidth ?? 0)
              : null,
          color: gradient1 == null ? backgroundColor : null,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: textAlign ?? TextAlign.center,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}