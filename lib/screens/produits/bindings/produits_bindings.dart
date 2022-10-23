

import 'package:get/instance_manager.dart';
import 'package:mdmscoops/screens/produits/controllers/produits_controller.dart';

class ProduitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProduitController>(() => ProduitController());
  }
}