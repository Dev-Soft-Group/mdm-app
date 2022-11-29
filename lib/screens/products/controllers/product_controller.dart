import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/categorie_model.dart';
import 'package:mdmscoops/services/remote_services/categorie/categorie.dart';

class ProductController extends GetxController {
  AppStatus productStatus = AppStatus.appDefault;
  final CategorieService _categorieService = CategorieServiceImpl();
  
List<Categorie> categoriesList = [];


@override
void onInit() async {
  await getProductsCategories();
  super.onInit();
}

  Future getProductsCategories() async {
    productStatus = AppStatus.appLoading;
    update();

    await _categorieService.getAllProductsCategories(onSuccess: (data) {
      categoriesList.clear();
      categoriesList.addAll(data.categories!);
      productStatus = AppStatus.appSuccess;
      update();
    }, onError: (e) {
      AppSnackBar.show(title: "Error", message: e.response!.data.toString());
      productStatus = AppStatus.appFailure;
      update();
    });
  }
}
