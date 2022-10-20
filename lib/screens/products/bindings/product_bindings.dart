

import 'package:get/get.dart';
import 'package:mdmscoops/screens/products/controllers/product_controller.dart';

class ProductBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }

}