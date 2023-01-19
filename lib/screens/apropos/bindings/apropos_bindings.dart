

import 'package:get/get.dart';
import 'package:mdmscoops/screens/apropos/controllers/apropos_controller.dart';

class AproposBinding implements Bindings{

  @override
  void dependencies(){
    Get.lazyPut<AproposController>(() => AproposController());
  }
}