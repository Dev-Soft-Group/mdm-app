

import 'package:get/get.dart';
import 'package:mdmscoops/screens/services/controllers/detail_services_controller.dart';
import 'package:mdmscoops/screens/services/controllers/services_controller.dart';
import 'package:mdmscoops/screens/services/controllers/services_form_controller.dart';

class ServicesBinding implements Bindings{

  @override
  void dependencies(){
    Get.lazyPut<ServicesFormController>(() => ServicesFormController());
    
    Get.lazyPut<ServiceController>(() => ServiceController());

    Get.lazyPut<ServiceDetailController>(() => ServiceDetailController());
  }
}