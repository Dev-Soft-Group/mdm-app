

import 'package:get/instance_manager.dart';
import 'package:mdmscoops/screens/publications/controllers/produit_form_controller.dart';
import 'package:mdmscoops/screens/publications/controllers/produits_controller.dart';

class ProduitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProduitController>(() => ProduitController());
    
    Get.lazyPut<ProduitFormController>(() => ProduitFormController());
  }
}