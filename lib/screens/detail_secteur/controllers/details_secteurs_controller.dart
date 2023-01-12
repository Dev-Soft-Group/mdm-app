import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/corps_metier_model.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';
import 'package:mdmscoops/services/remote_services/secteur_activite/secteur_activite.dart';

class SecteurDetailsController extends GetxController {
  final SecteurActiviteService _secteurActiviteService =
      SecteurActiviteServiceImpl();
  AppStatus corpsMetierStatus = AppStatus.appDefault;

  TextEditingController searchText = TextEditingController();

  List<CorpsMetier> corpsMetierList = [];

  int selectedTabs = 0;

  void onTabChange(int index) {
    selectedTabs = index;
    update();
  }

  SecteurActivite? secteur;

  @override
  void onInit() async {
    secteur = Get.arguments["secteur"];
    update();
    await getCorpsMetierForSector();
    super.onInit();
  }

  @override
  void dispose() {
    secteur = null;
    update();
    super.dispose();
  }

  Future getCorpsMetierForSector() async {
    corpsMetierStatus = AppStatus.appLoading;
    update();
    await _secteurActiviteService.getCorpsMetierForSector(
        idSecteur: secteur!.id.toString(),
        onSuccess: (data) {
          corpsMetierList = data.corpsMetiers!;
          corpsMetierStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          corpsMetierStatus = AppStatus.appFailure;
          update();
        });
  }

  Future searchAllCoprsForSecteurActivite({String? value}) async {
    searchText.text = value ?? "";
    corpsMetierStatus = AppStatus.appLoading;
    update();
    await _secteurActiviteService.searchAllCoprsForSecteurActivite(
        data: {"search": searchText.text, "idSecteur": secteur!.id!},
        onSuccess: (data) {
          corpsMetierList = data.corpsMetiers!;
          corpsMetierStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          corpsMetierStatus = AppStatus.appFailure;
          update();
        });
  }
}
