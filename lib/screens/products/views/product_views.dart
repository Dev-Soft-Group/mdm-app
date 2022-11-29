import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/card_item.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/products/controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void openDrawer() {
      _scaffoldKey.currentState!.openDrawer();
    }

    return SafeArea(
      child: GetBuilder<ProductController>(
        builder: (controller) => Scaffold(
          key: _scaffoldKey,
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
                AppBanner(open: openDrawer),
                Expanded(
                  child: RefreshIndicator(
                    color: kPrimaryColor,
                    backgroundColor: kWhiteColor,
                    onRefresh: () async {
                      await controller.getProductsCategories();
                    },
                    child: controller.productStatus == AppStatus.appLoading
                        ? Container(
                            color: kWhiteColor,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                                color: kPrimaryColor))
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...List.generate(
                                    controller.categoriesList.length,
                                    (i) => Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: kDefaultPadding),
                                                child: TextTitle(
                                                    text: controller.categoriesList[i].nom!.toString().capitalizeFirst!),
                                              ),
                                              const SizedBox(
                                                  height: kDefaultPadding/2),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    ...List.generate(
                                                       controller.categoriesList[i].produits!.length,
                                                        (j) =>
                                                          CardItem(item: controller.categoriesList[i].produits![j]))
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: kDefaultPadding / 2),
                                            ])),
                                const SizedBox(height: kDefaultPadding * 2),
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
