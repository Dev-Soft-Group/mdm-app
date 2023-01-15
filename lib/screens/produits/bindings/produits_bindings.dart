

import 'package:get/get.dart';
import 'package:mdmscoops/screens/produits/controllers/produit_controller.dart';
import 'package:mdmscoops/screens/produits/controllers/produit_form_controller.dart';

class ProduitsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProduitController>(() => ProduitController());

    // ProduitFormController
    Get.lazyPut<ProduitFormController>(() => ProduitFormController());
  }

}