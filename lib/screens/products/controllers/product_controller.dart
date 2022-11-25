import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/services/remote_services/categorie/categorie.dart';

class ProductController extends GetxController {
  AppStatus productStatus = AppStatus.appDefault;
  final CategorieService _categorieService = CategorieServiceImpl();
  


  Future getProductsCategories() async {
    productStatus = AppStatus.appLoading;
    update();

    await _categorieService.getAllProductsCategories(onSuccess: (data) {
      AppSnackBar.show(title: data.message, message: data.categories![0].produits!.length.toString(), backColor: kBlackColor);
      productStatus = AppStatus.appSuccess;
      update();
    }, onError: (e) {
      AppSnackBar.show(title: "Error", message: e.response!.data.toString());
      productStatus = AppStatus.appFailure;
      update();
    });
  }
}
