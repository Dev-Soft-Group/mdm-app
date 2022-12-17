

import 'package:get/instance_manager.dart';
import 'package:mdmscoops/screens/entreprise/controllers/entreprise_controller.dart';
import 'package:mdmscoops/screens/entreprise/controllers/my_enterprise_controller.dart';

class EntreprisesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntrepriseController>(() => EntrepriseController());

    Get.lazyPut<MyEnterpriseController>(() => MyEnterpriseController());
  }
}