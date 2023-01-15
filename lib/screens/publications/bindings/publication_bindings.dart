

import 'package:get/instance_manager.dart';
import 'package:mdmscoops/screens/publications/controllers/publications_controller.dart';
import 'package:mdmscoops/screens/publications/controllers/publications_form_controller.dart';

class PublicationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicationsController>(() => PublicationsController());
    
    Get.lazyPut<PublicationFormController>(() => PublicationFormController());
  }
}