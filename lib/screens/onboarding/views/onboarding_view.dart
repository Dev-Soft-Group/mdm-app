import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/screens/onboarding/controllers/ondoarding_controller.dart';
import 'package:mdmscoops/screens/onboarding/views/onboarding.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      const OnboardingOne(),
      const OnboardingTwo(),
      const OnboardingThree(),
      const OnboardingFour(),
      const OnboardingFive(),
    ];

    return SafeArea(
      child: GetBuilder<OnboardingController>(builder: (context) {
        return Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(),
            child: PageView.builder(
                itemCount: pages.length,
                itemBuilder: (context, index) => pages[index]),
          ),
        );
      }),
    );
  }
}
