

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/request_model/login_model.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/authentication/authentication_service.dart';
import 'package:mdmscoops/services/remote_services/authentication/authentication_service_impl.dart';

class ConnexionController extends GetxController{

  bool obscureText = true;

  final RemoteAuthService _authService =
      RemoteAuthServiceImpl();

  final LocalAuthService _localAuth =
      LocalAuthServiceImpl();

  AppStatus loginStatus = AppStatus.appDefault;

  // final UtilisateurService _userService = UtilisateurServiceImpl();

  final TextEditingController textEditingNom = TextEditingController();
  final TextEditingController textEditingPassword = TextEditingController();


  @override
  void dispose() {
    textEditingNom.dispose();
    textEditingPassword.dispose();
    super.dispose();
  }


    Future login(BuildContext context) async {
    loginStatus = AppStatus.appLoading;
    update();
    await _authService.login(
        loginReqModel: LoginRequestModel(
            username: textEditingNom.text.trim(),
            password: textEditingPassword.text.trim()),
        onLoginSuccess: (data) async {
          await _localAuth.saveToken(data.access);
          textEditingNom.clear();
          textEditingPassword.clear();
          Get.offAllNamed(AppRoutes.INSCRIPTION);
        },
        onLoginError: (error) {
          if (error.response!.statusCode == 400) {
            // CustomSnacbar.showMessage(context, "Le champs nom ou mot de passe ne peut être vide !");
          }
          
          if (error.response!.statusCode == 401) {
            // CustomSnacbar.showMessage(context, "Aucun compte actif avec pour nom '${textEditingNom.text}' et mot de passe '${textEditingPassword.text}'");
          }
          print("============ Login =============");
          print("Une erreur est survenue ${error.response!.data}");
          print(error.response!.statusCode);
          print("================================");
          loginStatus = AppStatus.appFailure;
          update();
        });
  }


}