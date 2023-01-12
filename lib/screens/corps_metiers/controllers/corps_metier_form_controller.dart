

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';
import 'package:mdmscoops/services/remote_services/corps_metier/corps_metier.dart';
import 'package:mdmscoops/services/remote_services/secteur_activite/secteur_activite.dart';

class CorpsMetierFormController extends GetxController{

  final CorpsMetierService _corpsMetierService = CorpsMetierServiceImpl();
  final SecteurActiviteService _secteursActivite = SecteurActiviteServiceImpl();

  AppStatus corpsMetierFormStatus = AppStatus.appDefault;

  TextEditingController textEditingNom = TextEditingController();

  String selectedSecteur = "Aucun";


  Future save() async {
    if (textEditingNom.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur", message: "Entrez le nom du corps métier svp !");
      return;
    }

    corpsMetierFormStatus = AppStatus.appLoading;
    update();

    await _corpsMetierService.addCorpsMetier(
        data: {"nom": textEditingNom.text.trim(),},
        onSuccess: (data) {
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          corpsMetierFormStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          corpsMetierFormStatus = AppStatus.appFailure;
          update();
        });
  }

  List<Map<String, dynamic>> secteurs = [
    {'id': '-1', "libelle": "Aucun"},
  ];

  Future getAllSecteursactivites() async {
    await _secteursActivite.getAllSecteurActivite(onSuccess: (data) {
      for (SecteurActivite map in data.secteurActivites!) {
        secteurs.add({"id": map.id!, "libelle": map.nom!});
      }
      if (secteurs.length > 1) {
        selectedSecteur = secteurs[1]['libelle'];
        secteurs.removeAt(0);
        secteurs.sort((a, b) => a['libelle'].compareTo(b['libelle']));
      }
      update();
    }, onError: (e) {
      AppSnackBar.show(
          title: "Erreur", message: e.response!.data["message"].toString());
      update();
    });
  }

  void onChangeSecteur(data) {
    selectedSecteur = data;
    update();
  }

}