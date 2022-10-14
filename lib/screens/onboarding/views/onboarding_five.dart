



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/onboarding/components/icon_button_action.dart';
import 'package:mdmscoops/screens/onboarding/components/onboarding_body.dart';
import 'package:mdmscoops/screens/onboarding/controllers/ondoarding_controller.dart';

class OnboardingFive extends StatelessWidget {
  const OnboardingFive({Key? key}) : super(key: key);


    @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return OnboardingBody(
        control: controller,
        title: "Allons-y",
        back: IconButtonAction(
          iconData: CupertinoIcons.chevron_left,
          onTap: () {},
        ),
        next: IconButtonAction(
          iconData: CupertinoIcons.chevron_right,
          onTap: () {},
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top : kDefaultPadding*1.5),
          child: Text(
            "DECOUVREZ !",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.2,
              letterSpacing: .8,
              fontSize: 16,
              color: kBlackColor.withOpacity(0.6),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        child: Text(
          "Tout cela et plus encore est ce que vous obtenez de l'application de recherche la plus cool du 237.",
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