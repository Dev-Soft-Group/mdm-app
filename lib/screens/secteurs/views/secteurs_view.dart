import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/secteurs/controllers/secteurs_controller.dart';

class SecteursView extends GetView<SecteursController> {
  const SecteursView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void openDrawer() {
      scaffoldKey.currentState!.openDrawer();
    }

    return SafeArea(
      child: GetBuilder<SecteursController>(
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
                AppBanner(
                  open: openDrawer,
                  onChanged: (text) async {
                    await controller.searchAllSecteurActivite(value: text);
                  },
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await controller.getAllSecteurActivite();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TextTitle(text: "Secteurs d'activités"),
                          const SizedBox(height: kDefaultPadding),
                          /*Container(
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
                          ),*/
                          // const SizedBox(height: kDefaultPadding - 4),
                          controller.secteursStatus == AppStatus.appLoading
                              ? Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                        color: kPrimaryColor.withOpacity(0.4)),
                                  ),
                                )
                              : controller.secteurActivitesList.isNotEmpty
                                  ? Expanded(
                                      child: GridView.count(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        shrinkWrap: true,
                                        children: List.generate(
                                            controller
                                                .secteurActivitesList.length,
                                            (index) => CustomCard(
                                                item: controller
                                                        .secteurActivitesList[
                                                    index])),
                                      ),
                                    )
                                  : Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal:
                                                  kDefaultPadding * 1.5),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Aucun résultat trouvé pour '${controller.searchText.text.toUpperCase()}'",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: kBlackColor
                                                    .withOpacity(0.4)),
                                          )),
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

  final SecteurActivite? item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.DETAILSSECTEURS, arguments: {"secteur": item!});
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
                Image.asset("assets/images/shoes.jpg",
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
                      item!.nom!.toString().capitalizeFirst!,
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
