// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/entreprise/controllers/entreprise_controller.dart';

class EntreprisesView extends GetView<EntrepriseController> {
  const EntreprisesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void openDrawer() {
      scaffoldKey.currentState!.openDrawer();
    }

    return SafeArea(
      child: GetBuilder<EntrepriseController>(
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
                    await controller.searchAllEntreprises(value: text);
                  },
                ),
                controller.entrepriseStatus == AppStatus.appLoading
                    ? Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                              color: kPrimaryColor.withOpacity(0.4)),
                        ),
                      )
                    : Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await controller.searchAllEntreprises();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const TextTitle(text: "Entreprises"),
                                const SizedBox(height: kDefaultPadding),
                                Container(
                                  height: 30,
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
                                                controller.menus[index]
                                                    ['libelle'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      controller.selectedTabs ==
                                                              index
                                                          ? kBlackColor
                                                          : kBlackColor
                                                              .withOpacity(0.4),
                                                  fontWeight:
                                                      controller.selectedTabs ==
                                                              index
                                                          ? FontWeight.w600
                                                          : FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          )),
                                ),
                                const SizedBox(height: kDefaultPadding - 4),
                                controller.entrepriseListStatus ==
                                        AppStatus.appLoading
                                    ? Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: CircularProgressIndicator(
                                              color: kPrimaryColor
                                                  .withOpacity(0.4)),
                                        ),
                                      )
                                    : controller.entreprisesList.isNotEmpty
                                        ? Expanded(
                                            child: GridView.count(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              shrinkWrap: true,
                                              children: List.generate(
                                                  controller
                                                      .entreprisesList.length,
                                                  (index) => CustomCard(
                                                      item: controller
                                                              .entreprisesList[
                                                          index])),
                                            ),
                                          )
                                        : Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          kDefaultPadding *
                                                              1.5),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Aucune entreprise pour le corps métier ${controller.menus[controller.selectedTabs]["libelle"]} !!!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: kBlackColor
                                                      .withOpacity(0.6),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                const SizedBox(height: kDefaultPadding * 1.5)
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

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Entreprise item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.ENTREPRISEDETAILS,
            arguments: {"idEntreprise": item.id});
      },
      child: Card(
        elevation: 0,
        child: Container(
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
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
            child: Stack(
              children: [
                item != null
                    ? CachedNetworkImage(
                        imageUrl: item.logoUrl!.toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                                colorFilter: const ColorFilter.mode(
                                    Colors.transparent, BlendMode.colorBurn)),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, size: 36),
                      )
                    : Image.asset("assets/images/shoes.jpg",
                        width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: kBlackColor.withOpacity(0.7),
                    ),
                    child: Text(
                      item.nom!.toString().capitalizeFirst!,
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
