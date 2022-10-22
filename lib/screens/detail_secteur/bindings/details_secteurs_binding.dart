

import 'package:get/instance_manager.dart';
import 'package:mdmscoops/screens/detail_secteur/controllers/details_secteurs_controller.dart';

class SecteurDetailssBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecteurDetailsController>(() => SecteurDetailsController());
  }
}