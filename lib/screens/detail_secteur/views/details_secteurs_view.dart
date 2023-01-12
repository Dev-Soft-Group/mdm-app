
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/corps_metier_model.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/detail_secteur/controllers/details_secteurs_controller.dart';

class SecteurDetailView extends GetView<SecteurDetailsController> {
  const SecteurDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SecteurDetailsController>(
        builder: (controller) => Scaffold(
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
                    open: () {
                      Get.back();
                    },
                    onChanged: (text) async { await controller.searchAllCoprsForSecteurActivite(value: text); },
                    iconData: Icons.arrow_back),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 3),
                        Card(
                          elevation: 3,
                          color: kWhiteColor,
                          shadowColor: kWhiteColor,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(kDefaultRadius)),
                          child: Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              color: kWhiteColor,
                            ),
                            child: Stack(
                              children: [
                                Row(children: [
                                  Image.asset("assets/images/sectors.png",
                                      height: 80, width: 90, fit: BoxFit.fill),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Secteur d'activité",
                                          style: TextStyle(
                                              color: kBlackColor.withOpacity(0.5),
                                              fontSize: 14),
                                        ),
                                        const SizedBox(height: 3),
                                        Flexible(
                                          child: Text(
                                            controller.secteur != null
                                                ? controller.secteur!.nom!
                                                    .toString()
                                                    .capitalizeFirst!
                                                : "Banque",
                                            style: const TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ]),
                                ]),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: InkWell(
                                    onTap: (){ Get.toNamed(AppRoutes.CREATE_SECTEUR_ACTIVITE, arguments: { "secteur": controller.secteur! } ); },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kWhiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 3),
                                            blurRadius: 10,
                                            color: kPrimaryColor.withOpacity(0.4),
                                          ),
                                        ]
                                      ),
                                      child: const Icon(Icons.edit, size: 20, color: kPrimaryColor)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const TextTitle(text: "Corps métiers"),
                        const SizedBox(height: kDefaultPadding),
                        controller.corpsMetierStatus == AppStatus.appLoading
                            ? Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor.withOpacity(0.4)),
                                ),
                              )
                            : controller.corpsMetierList.isNotEmpty
                                ? Expanded(
                                    child: GridView.count(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      shrinkWrap: true,
                                      children: List.generate(
                                          controller.corpsMetierList.length,
                                          (index) => CoprsMetier(
                                              item: controller
                                                  .corpsMetierList[index])),
                                    ),
                                  )
                                : Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: kDefaultPadding * 1.5),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Aucun corps métier trouvé dont le secteur d'activité est ${ controller.searchText.text.isEmpty ? controller.secteur!.nom!.toUpperCase() : controller.searchText.text.toUpperCase()}.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: kBlackColor.withOpacity(0.5),
                                            height: 1.5,
                                            fontSize: 16,
                                          ),
                                        )),
                                  ),
                        const SizedBox(height: kDefaultPadding * 1.5)
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


class CoprsMetier extends StatelessWidget {
  const CoprsMetier({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CorpsMetier item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){ Get.toNamed(AppRoutes.CROPS_METIER_DETAIL, arguments: {"corpsMetier": item});},
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
                Image.asset("assets/images/photo.jpg",
                height: double.infinity,
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
                    child: Text(item.nom!.toString().capitalizeFirst!,
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
