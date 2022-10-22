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
        width: 80,
        margin: const EdgeInsets.only(
            left: kDefaultPadding / 1.8,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2),
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 3,
                      color: kBlackColor.withOpacity(0.3),
                    )
                  ],
                ),
                child: Image.asset("assets/images/shoes.jpg",
                    width: double.infinity, fit: BoxFit.cover)),
            const SizedBox(height: 5,),
            Text(
              "Chaussure de sport",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kBlackColor.withOpacity(0.4),
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }
}
