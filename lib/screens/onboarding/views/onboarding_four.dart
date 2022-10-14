



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/screens/onboarding/components/icon_button_action.dart';
import 'package:mdmscoops/screens/onboarding/components/onboarding_body.dart';
import 'package:mdmscoops/screens/onboarding/controllers/ondoarding_controller.dart';
class OnboardingFour extends StatelessWidget {
  const OnboardingFour({Key? key}) : super(key: key);

  
    @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return OnboardingBody(
        control: controller,
        title: "Trouver des Services",
       back: IconButtonAction(
          iconData: CupertinoIcons.chevron_left,
          onTap: () { controller.previousPage(); },
        ),
        next: IconButtonAction(
          iconData: CupertinoIcons.chevron_right,
         onTap: () { controller.nextPage(); },
        ),
        child: Text(
          "Trouvez des services en rapport avec vos activités ou quel qu'en soit le secteur visé.",
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