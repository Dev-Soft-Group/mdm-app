

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/services/remote_services/corps_metier/corps_metier.dart';

class CorpsMetierFormController extends GetxController{

  final CorpsMetierService _corpsMetierService = CorpsMetierServiceImpl();

  AppStatus corpsMetierFormStatus = AppStatus.appDefault;

  TextEditingController textEditingNom = TextEditingController();


  @override
  void onInit() async {
    super.onInit();
  }

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

}