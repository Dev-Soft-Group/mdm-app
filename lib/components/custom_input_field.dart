

import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';

class FormFieldInput extends StatelessWidget {
  const FormFieldInput({
    Key? key,
    this.onChanged,
    this.hintText,
    this.suffixIcon,
    this.radius,
    this.maxLines,
    this.keyboardType,
    this.textController,
    this.height,
    this.contentPadding,
  }) : super(key: key);

  final Function(String data)? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final double? radius;
  final int? maxLines;
  final TextEditingController? textController;
  final TextInputType? keyboardType;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxLines != null ? null : (height ?? 45),
      padding: const EdgeInsets.only(
          left: kDefaultPadding / 2, right: kDefaultPadding / 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? kDefaultRadius),
        border: Border.all(
          width: 1.2,
          color: kBlackColor.withOpacity(0.15),
        ),
      ),
      child: TextFormField(
        controller: textController,
        onChanged: onChanged,
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: maxLines != null ? null : hintText,
          labelStyle: const TextStyle(
            color: kBlackColor,
          ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: contentPadding ?? const EdgeInsets.only(top:-3, right:0, bottom:3, left:0),
        ),
      ),
    );
  }
}