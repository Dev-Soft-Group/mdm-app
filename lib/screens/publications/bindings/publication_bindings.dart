

import 'package:get/instance_manager.dart';
import 'package:mdmscoops/screens/publications/controllers/publication_form_controller.dart';
import 'package:mdmscoops/screens/publications/controllers/produit_controller.dart';

class ProduitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProduitController>(() => ProduitController());
    
    Get.lazyPut<PublicationFormController>(() => PublicationFormController());
  }
}