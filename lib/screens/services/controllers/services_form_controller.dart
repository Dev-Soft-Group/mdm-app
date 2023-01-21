// ignore_for_file: empty_catches

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/services_models.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/services/service.dart';

class ServicesFormController extends GetxController {
  final ServicesService _serviceService = ServicesServiceImpl();

  @override
  void onInit() async {
    await getAllServicesNotForMy();
    super.onInit();
  }

  final LocalAuthService _authService = LocalAuthServiceImpl();

  AppStatus servicesStatus = AppStatus.appDefault;
  AppStatus saveStatus = AppStatus.appDefault;

  List<Service> servicesList = [];

  List<String> selectedList = [];

  Future getAllServicesNotForMy() async {
    servicesStatus = AppStatus.appLoading;
    update();
    await _serviceService.getAllServicesNotForMy(
      idEntreprise: await _authService.getEntrepriseId(),
      onSuccess: (data) {
      servicesList = data.services!;
      servicesStatus = AppStatus.appSuccess;
      update();
    }, onError: (e) {
      AppSnackBar.show(title: "Error", message: e.response!.data["message"]);
      servicesStatus = AppStatus.appFailure;
      update();
    });
  }

  void addToList(String idService) {
    dynamic index = selectedList.indexOf(idService);
    if (index < 0) {
      selectedList.add(idService);
    } else {
      selectedList.removeAt(index);
    }
    update();
  }

  bool verifyValue(String idService) {
    return selectedList.contains(idService);
  }

  Future save() async {
    saveStatus = AppStatus.appLoading;
    update();
    await _serviceService.addService(
        data: {"query": selectedList},
        idEntreprise: await _authService.getEntrepriseId(),
        onSuccess: (data) async {
          await getAllServicesNotForMy();
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          selectedList.clear();
          saveStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          saveStatus = AppStatus.appFailure;
          update();
        });
  }
}
