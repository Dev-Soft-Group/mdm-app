

import 'package:get/get.dart';
import 'package:mdmscoops/screens/services/controllers/services_form_controller.dart';

class ServicesFormBinding implements Bindings{

  @override
  void dependencies(){
    Get.lazyPut<ServicesFormController>(() => ServicesFormController());
  }
}