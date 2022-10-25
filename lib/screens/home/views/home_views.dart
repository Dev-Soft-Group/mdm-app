import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/home/components/line_item.dart';
import 'package:mdmscoops/screens/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);


   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
          key: controller.scaffoldKey,
          drawer: const NavigationDrawer(),
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
                AppBanner(controller: controller),
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

