import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              left: kDefaultPadding / 2,
              top: kDefaultPadding / 2,
              bottom: kDefaultPadding / 2),
          decoration: BoxDecoration(
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 3,
                color: kBlackColor.withOpacity(0.3),
              )
            ],
          ),
          child: Image.asset("assets/images/shoes.jpg", width: double.infinity, fit: BoxFit.cover)),
    );
  }
}
