import 'package:get/get.dart';
import 'package:mdmscoops/screens/profil_entrepreneur/controllers/profil_entrepreneur_controller.dart';

class ProfilEntrepreneurBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilEntrepreneurController>(() => ProfilEntrepreneurController());
  }
}
