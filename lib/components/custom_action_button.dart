import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(kDefaultRadius * 10),
          ),
          child: Text(title!,
              style: const TextStyle(
                color: kWhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}
