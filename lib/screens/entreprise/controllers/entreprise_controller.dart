

import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/corps_metier_model.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/services/remote_services/corps_metier/corps_metier.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';

class EntrepriseController extends GetxController{

  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();
  final CorpsMetierService _corpsMetiers = CorpsMetierServiceImpl();
  AppStatus entrepriseStatus = AppStatus.appDefault;
  AppStatus entrepriseListStatus = AppStatus.appDefault;

  int selectedTabs = 0;

  List<Entreprise> entreprisesList = [];
  List<Entreprise> entreprisesListCopy = [];


  List menus = [
    {"id":"-1", "libelle":"Tous",},
  ];

  void onTabChange(int index) async {
    selectedTabs = index;
    if (selectedTabs == 0){
      entreprisesList = entreprisesListCopy;
      update();
      return;
    }
    await getAllEntrepriseForCorpsMetier();
  }

  @override
  void onInit() async {
    await getAllEntreprises();
    await getAllCorpsMetiers();
    super.onInit();
  }

  Future getAllEntreprises() async {
    entrepriseStatus = AppStatus.appLoading;
    update();
    await _entrepriseService.getAllEntreprises(
      onSuccess: (data){
        entreprisesListCopy = data.entreprises!;
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


   Future getAllEntrepriseForCorpsMetier() async {
    entrepriseListStatus = AppStatus.appLoading;
    update();
    await _corpsMetiers.getAllEntrepriseForCorpsMetier(
      idCorpsMetier: menus[selectedTabs]["id"],
      onSuccess: (data){
        entreprisesList = data.entreprises!;
        entrepriseListStatus = AppStatus.appSuccess;
        update();
      },
      onError: (e){
        entrepriseListStatus = AppStatus.appFailure;
        update();
      }
    );
  }

  
  Future getAllCorpsMetiers() async {
    await _corpsMetiers.getAllCorpsMetier(onSuccess: (data) {
      for (CorpsMetier map in data.corpsMetiers!) {
        menus.add({"id": map.id!, "libelle": map.nom!});
      }
      update();
    }, onError: (e) {
      AppSnackBar.show(
          title: "Erreur", message: e.response!.data["message"].toString());
      update();
    });
  }
}