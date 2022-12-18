import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/services_models.dart';
import 'package:mdmscoops/services/remote_services/services/service.dart';



class ServiceController extends GetxController{
  final ServicesService _servicetService = ServicesServiceImpl();

  AppStatus servicesStatus = AppStatus.appDefault;

  int selectedTabs = 0;

  List<Service> servicesList = [];

  @override
  void onInit() async {
    await getAllServices();
    super.onInit();
  }

  Future getAllServices() async {
    servicesStatus = AppStatus.appLoading;
    update();
    await _servicetService.getAllServices(onSuccess: (data) {
      servicesList = data.services!;
      servicesStatus = AppStatus.appSuccess;
      update();
    }, onError: (e) {
      AppSnackBar.show(title: "Error", message: e.response!.data["message"]);
      servicesStatus = AppStatus.appFailure;
      update();
    });
  }
}