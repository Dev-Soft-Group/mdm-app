import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';

class ProduitDetailController extends GetxController {
  final ProduitService _produitService = ProduitServiceImpl();

  AppStatus productStatus = AppStatus.appDefault;

  Future getProductById() async {
    productStatus = AppStatus.appLoading;
    update();
    await _produitService.getProduitById(
        productId: "660f785c-29bb-422c-8e11-406d462d408b",
        onSuccess: (data) {
          print(data);
          productStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data.toString());
          productStatus = AppStatus.appFailure;
          update();
        });
  }
}
