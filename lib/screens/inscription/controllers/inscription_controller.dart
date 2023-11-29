// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/request_model/register_model.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/services/remote_services/authentication/authentication.dart';

class InscriptionController extends GetxController {
  bool obscureText = true;

  final RemoteAuthService _authService = RemoteAuthServiceImpl();

  AppStatus registerStatus = AppStatus.appDefault;

  final TextEditingController textEditingNom = TextEditingController();
  final TextEditingController textEditingPassword = TextEditingController();
  final TextEditingController textEditingEmail = TextEditingController();

  @override
  void dispose() {
    textEditingNom.dispose();
    textEditingPassword.dispose();
    textEditingEmail.dispose();
    super.dispose();
  }

  void hideAndShow() {
    obscureText = !obscureText;
    update();
  }

  Future register() async {
    if (textEditingNom.text.trim().isEmpty) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer votre nom d'utilisateur svp");
      return;
    }
    if (textEditingNom.text.trim().length < 4) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Votre nom doit contenir au moins 04 caractères !");
      return;
    }
    
    if (textEditingPassword.text.trim().length < 6) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Votre mot de passe doit contenir au moins 06 caractères !");
      return;
    }
    if (!GetUtils.isEmail(textEditingEmail.text.trim())) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer une adresse électronique valide!");
      return;
    }
    registerStatus = AppStatus.appLoading;
    update();
    await _authService.register(
        registerReqModel: RegisterRequestModel(
            username: textEditingNom.text.trim(),
            email: textEditingEmail.text.trim(),
            password: textEditingPassword.text.trim()),
        onSuccess: (data) async {
          textEditingNom.clear();
          textEditingPassword.clear();
          textEditingEmail.clear();
          registerStatus = AppStatus.appSuccess;
          AppSnackBar.show(
              title: "Succès",
              message:
                  "Compte crée avec succès. Vous pouvez à présent vous connecter",
              backColor: kPrimaryColor);
          update();
          Get.offAllNamed(AppRoutes.CONNEXION);
        },
        onError: (error) {
          AppSnackBar.show(
              title: "Erreur", message: error.response!.message.toString());
          print("============ Register =============");
          print("Une erreur est survenue $error");
          print(error.response!.statusCode);
          print("================================");
          registerStatus = AppStatus.appFailure;
          update();
        });
  }
}
