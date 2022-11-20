import 'package:get/get.dart';

class ProductController extends GetxController {
  int i = 0;
  Future doing() async {
    print("Refreshing...");
    await Future.delayed(const Duration(seconds: 5,));
    print(++i);
    await Future.delayed(const Duration(seconds: 3,));
  }
}
