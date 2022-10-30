

import 'package:get/get.dart';
import 'package:mdmscoops/screens/compte/controllers/compte_controller.dart';

class CompteBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CompteController>(() => CompteController());
  }
}