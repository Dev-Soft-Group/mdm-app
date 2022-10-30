

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
  }) : super(key: key);

  final Function(String data)? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final double? radius;
  final int? maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: kDefaultPadding / 2, right: kDefaultPadding / 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? kDefaultRadius),
        border: Border.all(
          width: 1.2,
          color: kBlackColor.withOpacity(0.6),
        ),
      ),
      child: TextFormField(
        onChanged: onChanged,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}