import 'package:get/get.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';

class StartController extends GetxController {
  final LocalAuthService _localAuth = LocalAuthServiceImpl();
  @override
  void onInit() async {
    if (await _localAuth.hasAuthenticate()) {
      Future.delayed(const Duration(milliseconds: 400), () {
        Get.offAllNamed(AppRoutes.PRODUCTS);
      });
    }
  }
}
