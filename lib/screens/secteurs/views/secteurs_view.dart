import 'package:flutter/cupertino.dart';
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
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ...List.generate(
                                                controller.secteurActivitesList
                                                    .length,
                                                (index) => CustomCard(
                                                    item: controller
                                                            .secteurActivitesList[
                                                        index])),
                                          ],
                                        ),
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
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
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
          child: ListTile(
            title: Text(
              item!.nom!.toString().capitalizeFirst!,
              style: TextStyle(
                color: kBlackColor.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              CupertinoIcons.chevron_right,
              size: 30,
              color: kPrimaryColor.withOpacity(0.7),
            ),
            subtitle: Text(
              "Ajouté le : ${DateTime.parse(item!.created_at!.toString()).day.toString().padLeft(2, "0")}-${DateTime.parse(item!.created_at!.toString()).month.toString().padLeft(2, "0")}-${DateTime.parse(item!.created_at!.toString()).year.toString().padLeft(2, "0")}",
              style: TextStyle(
                color: kBlackColor.withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 0, right: 0),
          ),
        ),
      ),
    );
  }
}
