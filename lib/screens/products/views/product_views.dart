import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/card_item.dart';
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
          key: controller.scaffoldKey,
          drawer: const NavigationDrawer(),
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              color: kWhiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBanner(controller: controller),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: kDefaultPadding),
                        child: TextTitle(text: "Coach Sportif"),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(10, (index) => const CardItem())
                          ],
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      const Padding(
                        padding: EdgeInsets.only(left: kDefaultPadding),
                        child: TextTitle(text: "Bureaux d'étude"),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(10, (index) => const CardItem())
                          ],
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      const Padding(
                        padding: EdgeInsets.only(left: kDefaultPadding),
                        child: TextTitle(text: "Immobilier"),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(10, (index) => const CardItem())
                          ],
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}


