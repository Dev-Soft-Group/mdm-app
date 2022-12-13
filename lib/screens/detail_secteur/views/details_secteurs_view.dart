import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/detail_secteur/controllers/details_secteurs_controller.dart';
import 'package:mdmscoops/screens/entreprise/views/entreprise_view.dart';

class SecteurDetailView extends GetView<SecteurDetailsController> {
  const SecteurDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void openDrawer() {
      scaffoldKey.currentState!.openDrawer();
    }

    return SafeArea(
      child: GetBuilder<SecteurDetailsController>(
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
                            child: Row(children: [
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
                                        controller.secteur != null ? controller.secteur!.nom!.toString().capitalizeFirst! : "Banque",
                                        style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const TextTitle(text: "Entreprises"),
                        const SizedBox(height: kDefaultPadding),
                        controller.entrepriseStatus == AppStatus.appLoading
                            ? Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor.withOpacity(0.4)),
                                ),
                              )
                            : Expanded(
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  shrinkWrap: true,
                                  children: List.generate(
                                      controller.entreprisesList.length,
                                      (index) => CustomCard(
                                          item: controller
                                              .entreprisesList[index])),
                                ),
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
