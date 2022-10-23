

import 'package:get/get.dart';
import 'package:mdmscoops/screens/detail_produit/controllers/produit_detail_controller.dart';

class ProduitDetailBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ProduitDetailController>(() => ProduitDetailController());
  }
}