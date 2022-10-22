

import 'package:get/instance_manager.dart';
import 'package:mdmscoops/screens/secteurs/controllers/secteurs_controller.dart';

class SecteursBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecteursController>(() => SecteursController());
  }
}