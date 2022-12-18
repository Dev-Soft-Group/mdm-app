import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/card_pub_item.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/publications/controllers/produits_controller.dart';

class ProduitsView extends GetView<ProduitController> {
  const ProduitsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    void openDrawer() {
      scaffoldKey.currentState!.openDrawer();
    }

    return SafeArea(
      child: GetBuilder<ProduitController>(
        builder: (controller) => Scaffold(
          key: scaffoldKey,
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
                    onRefresh: ()async{  await controller.getAllPublications();},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextTitle(text: "Catégories"),
                        ),
                        const SizedBox(height: kDefaultPadding - 2),
                        Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
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
                                          color: controller.selectedTabs == index
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
                              margin: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Wrap(
                                runSpacing: 0,
                                spacing: kDefaultPadding / 2,
                                children: [
                                  ...List.generate(
                                      controller.publicationsList.length,
                                      (index) => CardPubItem(
                                        onMessage: () async { await controller.sendWhatsAppMessenger(controller.publicationsList[index]);},
                                            item: controller.publicationsList[index],
                                            width: Get.width / 2 - 25,
                                            left: 0,
                                            bottom: 0,
                                            bottomLeft: kDefaultPadding - 4,
                                            containerHeight: 212,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
