import 'package:get/route_manager.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/onboarding/bindings/onboarding_bindings.dart';
import 'package:mdmscoops/screens/onboarding/views/onboarding.dart';



class AppPages {
  // Nous définisons ici les pages qui seront appelée en fonction des routes demandées
  static final pages = [
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
