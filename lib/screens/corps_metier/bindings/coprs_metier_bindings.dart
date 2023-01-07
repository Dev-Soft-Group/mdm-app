

import 'package:get/get.dart';
import 'package:mdmscoops/screens/corps_metier/controllers/corps_metier_form_controller.dart';

class CorpsMetierFormBinding implements Bindings{
  
  @override
  void dependencies(){
    Get.lazyPut<CorpsMetierFormController>(() => CorpsMetierFormController());
  }
}