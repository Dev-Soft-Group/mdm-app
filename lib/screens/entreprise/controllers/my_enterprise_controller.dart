import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';

class MyEnterpriseController extends GetxController {
  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();
  final LocalAuthService _localService = LocalAuthServiceImpl();

  AppStatus entrepriseStatus = AppStatus.appDefault;

  int selectedTabs = 0;

  List<Entreprise> entreprisesList = [];

  @override
  void onInit() async {
    await getAllEntreprisesForMe();
    super.onInit();
  }

  Future getAllEntreprisesForMe() async {
    entrepriseStatus = AppStatus.appLoading;
    update();
    await _entrepriseService.getAllEntreprisesForMe(onSuccess: (data) {
      entreprisesList = data.entreprises!;
      entrepriseStatus = AppStatus.appSuccess;
      update();
    }, onError: (e) {
      AppSnackBar.show(title: "Error", message: e.response!.data["message"]);
      entrepriseStatus = AppStatus.appFailure;
      update();
    });
  }

  Future saveEntreprise(String idEntreprise) async {
    bool result = await _localService.saveEntrepriseId(idEntreprise);
    if (result) {
      Get.toNamed(AppRoutes.PROFILENTREPRENEUR);
    }
  }
}
