

import 'package:get/get.dart';
import 'package:mdmscoops/screens/detail_corps_metier/controllers/detail_corps_metier_controller.dart';

class CorpsMetierDetailBinding implements Bindings{
  
  @override
  void dependencies() {
    Get.lazyPut<CorpsMetierDetailController>(() => CorpsMetierDetailController());
  }

}