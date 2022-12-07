import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';

class ProduitDetailController extends GetxController {
  final ProduitService _produitService = ProduitServiceImpl();

  AppStatus productStatus = AppStatus.appDefault;

  String idProduit = "";
  Produit? produit;

  @override
  void onInit() async {
    idProduit = Get.arguments["idProduit"].toString();
    await getProductById();
    super.onInit();
  }

  Future getProductById() async {
    productStatus = AppStatus.appLoading;
    update();
    await _produitService.getProduitById(
        productId: idProduit,
        onSuccess: (data) {
          produit = data;
          productStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data["message"].toString());
          productStatus = AppStatus.appFailure;
          update();
        });
  }
}
