// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';

class EntrepriseDetailController extends GetxController {
  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();

  AppStatus entrepriseStatus = AppStatus.appDefault;

  String idEntreprise = "";
  Entreprise? entreprise;

  List<String> siteWeb = [];

  @override
  void onInit() async {
    idEntreprise = Get.arguments["idEntreprise"];
    await getEntrepriseById();
    update();
    super.onInit();
  }

  Future<void> getEntrepriseById() async {
    entrepriseStatus = AppStatus.appLoading;
    update();

    await _entrepriseService.getEntrepriseById(
        idEntreprise: idEntreprise.toString(),
        onSuccess: (data) {
          entreprise = data;
          siteWeb = entreprise!.sites!.split(", ");
          entrepriseStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(title: "Erreur", message: e.response!.data["message"].toString());
          entrepriseStatus = AppStatus.appFailure;
          update();
        });
  }
}
