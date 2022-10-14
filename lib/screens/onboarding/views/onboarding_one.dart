
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/screens/onboarding/components/icon_button_action.dart';
import 'package:mdmscoops/screens/onboarding/components/onboarding_body.dart';
import 'package:mdmscoops/screens/onboarding/controllers/ondoarding_controller.dart';

class OnboardingOne extends GetView<OnboardingController> {
  const OnboardingOne({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return OnboardingBody(
        control: controller,
        title: "Bienvenue",
        next: IconButtonAction(
          iconData: CupertinoIcons.chevron_right,
          onTap: () {},
        ),
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
        ),
      );
    });
  }
}
