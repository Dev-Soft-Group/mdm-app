
import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key, required this.text}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text!,
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Container(
          height: 5,
          width: 50,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}