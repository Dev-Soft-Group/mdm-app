

import 'package:get/get.dart';

class SecteurDetailsController extends GetxController{

  int selectedTabs = 0;

  List menus = [
    "Tous",
    "Secteurs",
    "Entreprises",
    "Produits",
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