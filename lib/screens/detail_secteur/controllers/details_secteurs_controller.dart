

import 'package:get/get.dart';

class SecteurDetailsController extends GetxController{

  int selectedTabs = 0;


  List categories = [
    "Eco-Bank",
    "Afrikland first bank",
    "CCA",
    "Orange Money",
    "MTN Money",
    "Express Union",
    "UBA",
  ];

  void onTabChange(int index) {
    selectedTabs = index;
    update();
  }
}