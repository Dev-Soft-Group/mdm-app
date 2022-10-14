


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/screens/onboarding/components/icon_button_action.dart';
import 'package:mdmscoops/screens/onboarding/components/onboarding_body.dart';
import 'package:mdmscoops/screens/onboarding/controllers/ondoarding_controller.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return OnboardingBody(
        control: controller,
        title: "Comparaison facile & rapide",
        back: IconButtonAction(
          iconData: CupertinoIcons.chevron_left,
          onTap: () {},
        ),
        next: IconButtonAction(
          iconData: CupertinoIcons.chevron_right,
          onTap: () {},
        ),
        child: Text(
          "Vous pouvez comparer différents produits en fonction du prix, de la note et de la qualité, de la distance, des spécifications et de nombreux autres paramètres.",
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