import 'package:get/get.dart';

class ProfilEntrepreneurController extends GetxController{
  
  int selectedTabs = 0;

  List menus = [
    "Publications",
    "Secteurs",
    "Entreprises",
    "Produits",
    "Services",
  ];

  void onTabChange(int index) {
    selectedTabs = index;
    update();
  }
}