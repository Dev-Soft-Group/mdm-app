import 'package:get/get.dart';
import 'package:mdmscoops/screens/detail_entreprise/controllers/detail_entreprise_controller.dart';

class EntrepriseDetailBindiing implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntrepriseDetailController>(() => EntrepriseDetailController());
  }
}
