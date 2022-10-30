import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';

class CustomOutlineActionButton extends StatelessWidget {
  const CustomOutlineActionButton({
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
            color: kWhiteColor,
            border: Border.all(
              width: 1.4,
              color:kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(kDefaultRadius * 10),
          ),
          child: Text(title!,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}
