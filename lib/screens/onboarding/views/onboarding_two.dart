import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/screens/onboarding/components/icon_button_action.dart';
import 'package:mdmscoops/screens/onboarding/components/onboarding_body.dart';
import 'package:mdmscoops/screens/onboarding/controllers/ondoarding_controller.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return OnboardingBody(
        control: controller,
        title: "Votre moteur de recherche !",
        back: IconButtonAction(
          iconData: CupertinoIcons.chevron_left,
          onTap: () { controller.previousPage(); },
        ),
        next: IconButtonAction(
          iconData: CupertinoIcons.chevron_right,
         onTap: () { controller.nextPage(); },
        ),
        child: Text(
          "Vous pouvez rechercher des produits par catégories; des services par secteurs d'activité et  par corps de métier.",
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
