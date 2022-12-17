

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/services/remote_services/secteur_activite/secteur_activite.dart';

class SecteurActiviteFormController extends GetxController{

  final SecteurActiviteService _secteurActiviteService = SecteurActiviteServiceImpl();

  AppStatus secteurActiviteFormStatus = AppStatus.appDefault;

  TextEditingController textEditingNom = TextEditingController();

  Future save() async {
    if (textEditingNom.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur", message: "Entrez le nom du secteur d'activité svp !");
      return;
    }

    secteurActiviteFormStatus = AppStatus.appLoading;
    update();

    await _secteurActiviteService.addSecteurActivite(
        data: {"nom": textEditingNom.text.trim(),},
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

}