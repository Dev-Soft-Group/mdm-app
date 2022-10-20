import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/card_item.dart';
import 'package:mdmscoops/components/product_item.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/products/controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProductController>(
        builder: (controller) => Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              color: kWhiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppBanner(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TextTitle(text: "Rechercher un produit"),
                          const SizedBox(height: kDefaultPadding),
                          const LineItem(title: "Baskets"),
                          const SizedBox(height: kDefaultPadding),
                          const LineItem(title: "Accessoires informatiques"),
                          const SizedBox(height: kDefaultPadding),
                          const LineItem(title: "Services"),
                          const SizedBox(height: kDefaultPadding),
                          const LineItem(title: "Auto école"),
                          const SizedBox(height: kDefaultPadding),
                          const LineItem(title: "Immobiliers"),
                          const SizedBox(height: kDefaultPadding),

                          ///
                          const SizedBox(height: kDefaultPadding * 2),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
              children: [...List.generate(10, (index) => const ProductItem())],
            ),
          ),
        ],
      ),
    );
  }
}
