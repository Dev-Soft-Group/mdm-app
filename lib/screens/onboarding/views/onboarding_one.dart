import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/onboarding/controllers/ondoarding_controller.dart';

class OnboardingOne extends GetView<OnboardingController> {
  OnboardingOne({Key? key}) : super(key: key);
  final OnboardingController onboar = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<OnboardingController>(builder: (controller) {
        return Scaffold(
          body: Container(
            height: 800,
            width: Get.width,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Column(
              children: [
                const SizedBox(height: kDefaultPadding * 3),
                Container(
                    height: 120,
                    width: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Image.asset("assets/images/D-SoftTechWhite.png",
                        fit: BoxFit.fill)),
                const SizedBox(height: kDefaultPadding * 3),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        decoration: const BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kDefaultRadius * 9)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: kDefaultPadding * 4.2),
                            Text(
                              "Bienvenue ${onboar.nom}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: kDefaultPadding * 1.5),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding,
                                ),
                                decoration: const BoxDecoration(),
                                child: Text(
                                  "Voici le service de recherche le plus  évolué et rapide du Cameroun. Recherchez ici vos produits et services, négociez directement les prix des produits avec les fournisseurs.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1.2,
                                    letterSpacing: .8,
                                    fontSize: 16,
                                    color: kBlackColor.withOpacity(0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                            const Spacer(),
                            Container(
                              alignment: Alignment.centerRight,
                              margin:
                                  const EdgeInsets.only(right: kDefaultPadding),
                              child: InkWell(
                                onTap: () {
                                  print("Page suivante");
                                },
                                child: const Icon(CupertinoIcons.chevron_right,
                                    color: kBlackColor, size: 26),
                              ),
                            ),
                            const SizedBox(height: kDefaultPadding),
                          ],
                        ))),
              ],
            ),
          ),
        );
      }),
    );
  }
}
