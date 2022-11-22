

import 'package:get/instance_manager.dart';
import 'package:mdmscoops/screens/publications/controllers/publications_controller.dart';

class PublicationFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicationFormController>(() => PublicationFormController());
  }
}