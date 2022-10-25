

import 'package:get/get.dart';

class EntrepriseController extends GetxController{

  int selectedTabs = 0;

  List menus = [
    "Tous",
    "Commerce",
    "Informatique",
    "Agricole",
    "Services",
  ];

  List categories = [
    "Banques",
    "Assurances",
    "Automobiles",
    "Energie & Ressources naturelles",
    "Industries",
    "Infrastructure & Construction",
  ];

  void onTabChange(int index) {
    selectedTabs = index;
    update();
  }
}