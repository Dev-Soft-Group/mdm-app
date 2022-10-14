import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/screens/onboarding/controllers/ondoarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<OnboardingController>(builder: (context) {
        return Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(),
            child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: (value) {
                  controller.selectedPage = value;
                  controller.update();
                },
                itemBuilder: (context, index) => Stack(
                      children: [
                        controller.pages[index],
                        Positioned(
                          top: Get.height * 0.33,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                controller.pages.length,
                                (index) => Container(
                                      height: 15,
                                      width: 15,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: controller.selectedPage == index ? kPrimaryColor : kPrimaryColor.withOpacity(0.2),
                                        shape: BoxShape.circle,
                                      ),
                                    )),
                          ),
                        ),
                      ],
                    )),
          ),
        );
      }),
    );
  }
}
