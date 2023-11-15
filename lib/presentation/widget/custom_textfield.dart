import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextStyle? textStyle;
  final double? width;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final Color? backgroundColor;
  final Color? borderColor;

  final Color? textFieldColor;

  final bool? obscureText;
  final TextEditingController contoller;
  final TextStyle? errorStyle;
  final String? errorText;
  final String? Function(String?)? validator;
  final double? borderRadius;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function()? onFocus;
  final void Function()? onBlur;
  final TextInputAction? textInputAction;

  final bool? enabled;

  final TextStyle? hintTextStyle;

  final Key? formKey;
  final bool autofocus;
  final TextAlign? textAlign;

  final int? maxLength;
  final bool applyScrollPadding;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.textStyle,
    this.width,
    this.textCapitalization,
    this.keyboardType,
    this.backgroundColor,
    this.obscureText,
    required this.contoller,
    this.errorStyle,
    this.errorText,
    this.validator,
    this.borderRadius,
    this.onChanged,
    this.maxLines,
    this.onFocus,
    this.onBlur,
    this.borderColor,
    this.textInputAction,
    this.enabled,
    this.textFieldColor,
    this.formKey,
    this.autofocus = false,
    this.hintTextStyle,
    this.textAlign,
    this.maxLength,
    this.applyScrollPadding = true,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = false;

  var focusNode = FocusNode();
  @override
  void initState() {
    _isObscure = widget.obscureText ?? false;
    focusNode.addListener(() {
      if (focusNode.hasFocus == true) {
        if (widget.onFocus != null) {
          widget.onFocus!();
        }
        // Future.delayed(
        //   const Duration(microseconds: 1),
        //   () {
        //     widget.contoller.selection =
        //         TextSelection.collapsed(offset: widget.contoller.text.length);
        //   },
        // );
      } else {
        if (widget.onBlur != null) {
          widget.contoller.text = widget.contoller.text.trim();
          widget.onBlur!();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String text = "";

    return Container(
      decoration: BoxDecoration(
        color: widget.textFieldColor,

        // color: Colors.purple,
        border: Border.all(
          width: widget.width ?? 0.5,
          color: widget.borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextFormField(
        scrollPadding: widget.applyScrollPadding
            ? EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              )
            : const EdgeInsets.all(0),
        textAlignVertical: TextAlignVertical.top,
        // textAlignVertical: TextAlignVertical.top,
        autofocus: widget.autofocus,

        textAlign: widget.textAlign ?? TextAlign.left,
        enabled: widget.enabled,
        focusNode: focusNode,
        maxLines: widget.maxLines ?? 1,
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
          if (value.isNotEmpty) {}
          if (widget.maxLength != null) {
            if (value.length <= widget.maxLength!) {
              text = value;
            } else {
              widget.contoller.text = text;
              widget.contoller.selection = TextSelection.fromPosition(
                TextPosition(
                  offset: widget.contoller.text.length,
                ),
              );
            }
          }
        },
        validator: widget.validator,
        controller: widget.contoller,
        obscureText: widget.obscureText != null
            ? (widget.obscureText! && _isObscure)
            : false,

        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.sentences,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        inputFormatters: widget.keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],

        style: widget.textStyle ??
            const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        autocorrect: false,

        textInputAction: widget.textInputAction ?? TextInputAction.next,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText != null
              ? IconButton(
                  icon: Icon(
                    _isObscure == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: widget.hintTextStyle,
          contentPadding: widget.obscureText != null
              ? 
              
                const EdgeInsets.only(left: 5, bottom: 0, top: 10)
              : const EdgeInsets.only(left: 5, bottom: 8, top: 0),

          border: InputBorder.none,
          errorStyle: widget.errorStyle,
          errorText: widget.errorText,
          labelText: widget.labelText,
          // fillColor: Colors.amber,
          // fillColor: widget.backgroundColor != Colors.transparent
          // ? widget.backgroundColor
          // : Colors.white,
          // filled: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
