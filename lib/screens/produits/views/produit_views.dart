import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/card_item.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/produits/controllers/produit_controller.dart';

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
          drawer: const AppNavigationDrawer(),
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
                AppBanner(
                    open: openDrawer,
                    onChanged: (text) async {
                      controller.clearVariables();
                      await controller.searchAllProductsCategories(value: text);
                    }),
                Expanded(
                  child: RefreshIndicator(
                    color: kPrimaryColor,
                    backgroundColor: kWhiteColor,
                    onRefresh: () async {
                      controller.categoriesList.clear();
                      controller.next = null;
                      controller.update();
                      await controller.searchAllProductsCategories(
                          value: controller.searchText.text);
                    },
                    child: controller.productStatus == AppStatus.appLoading &&
                            controller.categoriesList.isEmpty
                        ? Container(
                            color: kWhiteColor,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                                color: kPrimaryColor))
                        : SingleChildScrollView(
                            controller: controller.parentScrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...List.generate(
                                    controller.categoriesList.length,
                                    (i) => ((controller.categoriesList[i]
                                                .produitModel!.count !=
                                            0)
                                        ? RowWidget(
                                            controller: controller,
                                            index: i,
                                          )
                                        : Container())),
                                controller.productStatus == AppStatus.appLoading
                                    ? Container(
                                        padding: const EdgeInsets.all(0),
                                        height: 150,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                              color: kPrimaryColor
                                                  .withOpacity(0.3)),
                                        ),
                                      )
                                    : Container(),
                                ((controller.categoriesList.isEmpty &&
                                            controller.productStatus ==
                                                AppStatus.appSuccess) ||
                                        !controller.isDataPresent)
                                    ? Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(),
                                        width: double.infinity,
                                        height: Get.height - 125,
                                        child: Text(
                                          "Ooops !!!\nAucune catégorie trouvée",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: kBlackColor.withOpacity(0.7),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    : Container(),
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

class RowWidget extends StatelessWidget {
  final dynamic controller;
  final int? index;
  const RowWidget({super.key, this.controller, this.index});
  @override
  Widget build(BuildContext context) {
    dynamic next;
    controller.toggleDataPresent(true);
    ScrollController childScrollController = ScrollController();

    void listenner() {
      childScrollController.addListener(() async {
        if (childScrollController.position.maxScrollExtent ==
            childScrollController.offset) {
          next = controller.categoriesList[index].produitModel!.next;
          if ((next != null &&
                  controller.categoriesList[index].produitModel!.isSearching ==
                      null) ||
              (next != null &&
                  !controller
                      .categoriesList[index].produitModel!.isSearching)) {
            controller.categoriesList[index].produitModel!.isSearching = true;
            controller.update();
            await Future.delayed(const Duration(seconds: 3));
            controller.categoriesList[index].produitModel!.isSearching =
                await controller.getPaginateProducts(next, index);
            controller.update();
          }
        }
      });
    }

    listenner();
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
            ),
            child: TextTitle(
                text:
                    "${controller.categoriesList[index].nom!.toString().capitalizeFirst!} (${controller.categoriesList[index].produitModel!.count})"),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          SingleChildScrollView(
            controller: childScrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    controller
                        .categoriesList[index].produitModel!.produits!.length,
                    (j) => CardItem(
                        liker: () async {
                          await controller.likerProduit(index, j);
                        },
                        onMessage: () async {
                          await controller.sendWhatsAppMessenger(controller
                              .categoriesList[index]
                              .produitModel!
                              .produits![j]);
                        },
                        onTap: () {
                          Get.toNamed(AppRoutes.PRODUITSDETAILS, arguments: {
                            'idProduit': controller.categoriesList[index]
                                .produitModel!.produits![j].id!
                          });
                        },
                        item: controller
                            .categoriesList[index].produitModel!.produits![j])),
                controller.categoriesList[index].produitModel!.isSearching !=
                            null &&
                        controller.categoriesList[index].produitModel!
                                .isSearching ==
                            true
                    ? Container(
                        padding: const EdgeInsets.all(0),
                        height: 150,
                        width: 240,
                        child: Center(
                          child: CircularProgressIndicator(
                              color: kPrimaryColor.withOpacity(0.3)),
                        ),
                      )
                    : Container(width: 20),
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
        ]);
  }
}
