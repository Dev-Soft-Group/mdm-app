

import 'package:get/instance_manager.dart';
import 'package:mdmscoops/screens/publications_form/controllers/publications_controller.dart';

class PublicationFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicationFormController>(() => PublicationFormController());
  }
}