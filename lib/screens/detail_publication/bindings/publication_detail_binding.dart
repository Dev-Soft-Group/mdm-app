

import 'package:get/get.dart';
import 'package:mdmscoops/screens/detail_publication/controllers/publication_detail_controller.dart';

class PublicationDetailBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<PublicationDetailController>(() => PublicationDetailController(), fenix: true);
  }
}