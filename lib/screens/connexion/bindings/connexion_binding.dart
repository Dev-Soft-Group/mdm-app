

import 'package:get/get.dart';
import 'package:mdmscoops/screens/connexion/controllers/connexion_controller.dart';

class ConnexionBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConnexionController>(() => ConnexionController());
  }
}