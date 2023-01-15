// ignore_for_file: empty_catches

import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/models/response_model/services_models.dart';
import 'package:mdmscoops/services/remote_services/services/service.dart';

class ServiceDetailController extends GetxController {
  final ServicesService _serviceService = ServicesServiceImpl();

  AppStatus entrepriseListStatus = AppStatus.appDefault;

  int selectedTabs = 0;

  List<Entreprise> entreprisesList = [];

  Service? service;

  @override
  void onInit() async {
    try {
      service = Get.arguments['service'];
      await getAllEntrepriseForService();
    } catch (e) {}
    super.onInit();
  }

  Future getAllEntrepriseForService() async {
    entrepriseListStatus = AppStatus.appLoading;
    update();
    await _serviceService.getAllEntrepriseForService(
      idService: service!.id!.toString(),
      onSuccess: (data) {
      entreprisesList = data.entreprises!;
      entrepriseListStatus = AppStatus.appSuccess;
      update();
    }, onError: (e) {
      AppSnackBar.show(title: "Error", message: e.response!.data["message"]);
      entrepriseListStatus = AppStatus.appFailure;
      update();
    });
  }
}
