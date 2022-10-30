

import 'package:get/get.dart';
import 'package:mdmscoops/screens/inscription/controllers/inscription_controller.dart';

class InscriptionBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<InscriptionController>(() => InscriptionController());
  }
}