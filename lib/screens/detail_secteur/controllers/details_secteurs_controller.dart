

import 'package:get/get.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';
import 'package:mdmscoops/services/remote_services/secteur_activite/secteur_activite.dart';

class SecteurDetailsController extends GetxController{

   final SecteurActiviteService _secteurActiviteService = SecteurActiviteServiceImpl();
  AppStatus entrepriseStatus = AppStatus.appDefault;


  List<Entreprise> entreprisesList = [];

  int selectedTabs = 0;


  void onTabChange(int index) {
    selectedTabs = index;
    update();
  }

  SecteurActivite? secteur;

  @override
  void onInit() async {
    secteur = Get.arguments["secteur"];
    // print("==================================");
    // print(secteur);
    update(); 
    await getEntreprisesForSector();
    super.onInit();
  }
  @override
  void dispose() {
    secteur = null;
    update();
    super.dispose();
  }

  Future getEntreprisesForSector() async {
    entrepriseStatus = AppStatus.appLoading;
    update();
    await _secteurActiviteService.getEntreprisesForSector(
      idSecteur: secteur!.id.toString(),
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