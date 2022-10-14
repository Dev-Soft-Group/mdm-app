

import 'package:get/get.dart';
import 'package:mdmscoops/screens/start/controllers/start_controller.dart';

class StartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartController>(() => StartController());
  }

}