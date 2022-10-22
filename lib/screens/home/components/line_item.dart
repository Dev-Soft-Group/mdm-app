import 'package:flutter/material.dart';
import 'package:mdmscoops/components/product_item.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';

class LineItem extends StatelessWidget {
  const LineItem({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.3,
          color: kBlackColor.withOpacity(0.02),
        ),
        borderRadius: BorderRadius.circular(kDefaultRadius * 1.2),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
            child: Text(
              title!,
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(10, (index) => const ProductItem()),
            ),
          ),
        ],
      ),
    );
  }
}
