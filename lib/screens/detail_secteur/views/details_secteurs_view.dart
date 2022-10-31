import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_banner.dart';
import 'package:mdmscoops/components/app_menu.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/detail_secteur/controllers/details_secteurs_controller.dart';

class SecteurDetailView extends GetView<SecteurDetailsController> {
  const SecteurDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void openDrawer() {
      _scaffoldKey.currentState!.openDrawer();
    }
    return SafeArea(
      child: GetBuilder<SecteurDetailsController>(
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
                                  children: [
                                    const Spacer(
                                      flex: 2,
                                    ),
                                    Text(
                                      "Secteur d'activité",
                                      style: TextStyle(
                                          color: kBlackColor.withOpacity(0.5),
                                          fontSize: 20),
                                    ),
                                    const SizedBox(height: 3),
                                    const Text(
                                      "Banque",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 2,
                                    ),
                                    Container(),
                                  ]),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const TextTitle(text: "Entreprises"),
                        const SizedBox(height: kDefaultPadding),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            shrinkWrap: true,
                            children: List.generate(
                                controller.categories.length,
                                (index) => CustomCard(
                                    item: controller.categories[index])),
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

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String? item;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    "$item",
                    style: const TextStyle(
                      color: kWhiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
