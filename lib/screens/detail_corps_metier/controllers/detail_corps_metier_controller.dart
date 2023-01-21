import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/corps_metier_model.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';
import 'package:mdmscoops/services/remote_services/secteur_activite/secteur_activite.dart';

class CorpsMetierDetailController extends GetxController {
  final SecteurActiviteService _secteurActiviteService =
      SecteurActiviteServiceImpl();

  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();

  AppStatus entrepriseStatus = AppStatus.appDefault;

  List<Entreprise> entreprisesList = [];

  TextEditingController searchText = TextEditingController();

  int selectedTabs = 0;

  void onTabChange(int index) {
    selectedTabs = index;
    update();
  }

  CorpsMetier? corpsMetier;

  @override
  void onInit() async {
    corpsMetier = Get.arguments["corpsMetier"];
    update();
    await getEntreprisesForCorpsMetier();
    super.onInit();
  }

  @override
  void dispose() {
    corpsMetier = null;
    update();
    super.dispose();
  }

  Future getEntreprisesForCorpsMetier() async {
    entrepriseStatus = AppStatus.appLoading;
    update();
    await _secteurActiviteService.getEntreprisesForCorpsMetier(
        idCorpsMetier: corpsMetier!.id.toString(),
        onSuccess: (data) {
          entreprisesList = data.entreprises!;
          entrepriseStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          entrepriseStatus = AppStatus.appFailure;
          update();
        });
  }


  Future searchAllEntreprises({String? value}) async {
    searchText.text = value ?? "";
    entrepriseStatus = AppStatus.appLoading;
    update();
    await _entrepriseService.searchAllEntreprises(
        data: {"search": searchText.text, "idCorps": corpsMetier!.id!},
        onSuccess: (data) {
          entreprisesList = data.entreprises!;
          entrepriseStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          entrepriseStatus = AppStatus.appFailure;
          update();
        });
  }
}
