

// ignore_for_file: empty_catches

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';
import 'package:mdmscoops/services/remote_services/secteur_activite/secteur_activite.dart';

class SecteurActiviteFormController extends GetxController{

  final SecteurActiviteService _secteurActiviteService = SecteurActiviteServiceImpl();

  AppStatus secteurActiviteFormStatus = AppStatus.appDefault;

  TextEditingController textEditingNomSecteur = TextEditingController();

  SecteurActivite? secteur;

  @override
  void onInit() {
    try {
      secteur = Get.arguments["secteur"];
      textEditingNomSecteur.text = secteur!.nom!.toString();
    } catch (e) {}
    update();
    super.onInit();
  }

  Future save() async {
    if (textEditingNomSecteur.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur", message: "Entrez le nom du secteur d'activité svp !");
      return;
    }

    secteurActiviteFormStatus = AppStatus.appLoading;
    update();

    if ( secteur != null ) {
      await updateSeteur();
      return;
    }

    await _secteurActiviteService.addSecteurActivite(
        data: {"nom": textEditingNomSecteur.text.trim(),},
        onSuccess: (data) {
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          secteurActiviteFormStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          secteurActiviteFormStatus = AppStatus.appFailure;
          update();
        });
  }


  Future updateSeteur() async {

    await _secteurActiviteService.updateSecteurActivite(
        data: {"nom": textEditingNomSecteur.text.trim(),},
        idSecteur: secteur!.id!.toString(),
        onSuccess: (data) {
          Get.back();
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          secteurActiviteFormStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          secteurActiviteFormStatus = AppStatus.appFailure;
          update();
        });
  }

}