

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/screens/onboarding/views/onboarding.dart';

class OnboardingController extends GetxController{

  final PageController pageController = PageController();

  int selectedPage = 0;

  final pages = [
      const OnboardingOne(),
      const OnboardingTwo(),
      const OnboardingThree(),
      const OnboardingFour(),
      const OnboardingFive(),
    ];

  void nextPage() {
    selectedPage += 1;
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    update();
  }

  void previousPage() {
    selectedPage -= 1;
    pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    update();
  }
}