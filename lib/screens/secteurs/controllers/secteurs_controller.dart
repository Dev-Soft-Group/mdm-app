

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';
import 'package:mdmscoops/services/remote_services/secteur_activite/secteur_activite.dart';

class SecteursController extends GetxController{


  final SecteurActiviteService _secteurActiviteService = SecteurActiviteServiceImpl();
   AppStatus secteursStatus = AppStatus.appLoading;

   TextEditingController searchText = TextEditingController();

  int selectedTabs = 0;

  List<SecteurActivite> secteurActivitesList = [];
  List<SecteurActivite> secteurActivitesListCopy = [];

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

  @override
  void onInit() async {
    await getAllSecteurActivite();
    super.onInit();
  }

  void onTabChange(int index) {
    selectedTabs = index;
    update();
  }


  
  Future getAllSecteurActivite() async {

    secteursStatus = AppStatus.appLoading;
    update();

    await _secteurActiviteService.getAllSecteurActivite(
      onSuccess: (data) {
        secteurActivitesList.addAll(data.secteurActivites!);
        secteurActivitesListCopy = data.secteurActivites!;
        secteursStatus = AppStatus.appSuccess;
        update();
      },
      onError: (e) {
        AppSnackBar.show(title:"Erreur", message:e.toString());
        secteursStatus = AppStatus.appFailure;
        update();
      }
    );
  }

  Future searchAllSecteurActivite({String? value}) async {
    searchText.text = value!;
    secteursStatus = AppStatus.appLoading;
    update();

    await _secteurActiviteService.searchAllSecteurActivite(
      data: { "search": searchText.text.trim() },
      onSuccess: (data) {
        secteurActivitesList.clear();
        secteurActivitesList.addAll(data.secteurActivites!);
        secteursStatus = AppStatus.appSuccess;
        update();
      },
      onError: (e) {
        AppSnackBar.show(title:"Erreur", message:e.toString());
        secteursStatus = AppStatus.appFailure;
        update();
      }
    );
  }
}