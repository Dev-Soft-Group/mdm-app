

import 'package:get/get.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';

class EntrepriseController extends GetxController{

  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();
  AppStatus entrepriseStatus = AppStatus.appDefault;

  int selectedTabs = 0;

  List<Entreprise> entreprisesList = [];


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

  @override
  void onInit() async {
    await getAllEntreprises();
    super.onInit();
  }

  Future getAllEntreprises() async {
    entrepriseStatus = AppStatus.appLoading;
    update();
    await _entrepriseService.getAllEntreprises(
      onSuccess: (data){
        entreprisesList = data.entreprises!;
        entrepriseStatus = AppStatus.appSuccess;
        update();
      },
      onError: (e){
        entrepriseStatus = AppStatus.appFailure;
        update();
      }
    );
  }
}