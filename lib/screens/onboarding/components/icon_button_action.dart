
import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';

class IconButtonAction extends StatelessWidget {
  const IconButtonAction({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final IconData? iconData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(iconData,
          color: kBlackColor, size: 26),
    );
  }
}
