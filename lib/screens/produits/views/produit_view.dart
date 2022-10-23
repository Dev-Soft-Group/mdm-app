import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/card_item.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/produits/controllers/produits_controller.dart';

class ProduitsView extends GetView<ProduitController> {
  const ProduitsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProduitController>(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric( horizontal: 20.0),
                        child: TextTitle(text: "Catégories"),
                      ),
                      const SizedBox(height: kDefaultPadding - 2),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric( horizontal: kDefaultPadding),
                        decoration: const BoxDecoration(),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.menus.length,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    controller.onTabChange(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: kDefaultPadding * 1.2,
                                        top: kDefaultPadding / 3,
                                        bottom: kDefaultPadding / 3),
                                    child: Text(
                                      controller.menus[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: controller.selectedTabs ==
                                                index
                                            ? kBlackColor
                                            : kBlackColor.withOpacity(0.4),
                                        fontWeight:
                                            controller.selectedTabs == index
                                                ? FontWeight.w600
                                                : FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                      const SizedBox(height: kDefaultPadding - 4),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            child: Wrap(
                              runSpacing: 0,
                              spacing: kDefaultPadding / 2,
                              children: [...List.generate(
                                  10,
                                  (index) => CardItem(
                                        width: Get.width / 2 - 25,
                                        left: 0,
                                        bottom: 0,
                                        bottomLeft: kDefaultPadding -4,
                                        containerHeight: 203,
                                        imageHeight: 100,
                                        logoTop: 85,
                                      )),
                                      const SizedBox(height: kDefaultPadding),
                                      ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
