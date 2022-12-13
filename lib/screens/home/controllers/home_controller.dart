
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/categorie_model.dart';
import 'package:mdmscoops/services/remote_services/categorie/categorie.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';

class HomeController extends GetxController {

  AppStatus productStatus = AppStatus.appDefault;
  final ProduitService _produitService = ProduitServiceImpl();
  final CategorieService _categorieService = CategorieServiceImpl();

  
  List<Categorie> categoriesList = [];

  ScrollController parentScrollController = ScrollController();

  int _count = 0;
  var next, previous;
  bool is_searching = false;

  

  @override
  void onInit() async {
    await getProductsCategories();
    await listerner();
    super.onInit();
  }


  Future listerner() async {
    parentScrollController.addListener(() async {
      if (parentScrollController.position.maxScrollExtent ==
          parentScrollController.offset) {
        if (next != null && !is_searching) {
          is_searching = true;
          productStatus = AppStatus.appLoading;
          update();
          Future.delayed(const Duration(seconds: 3), () async {
            await getProductsCategories();
          });
        }
      }
    });
  }

  Future getProductsCategories() async {
    productStatus = AppStatus.appLoading;
    update();
    await _categorieService.getAllProductsCategories(
      pageSize: 3.toString(),
      url: next,
      onSuccess: (data) {
      _count = data.count!;
      next = data.next;
      previous = data.previous;
      categoriesList.addAll(data.categories!);
      productStatus = AppStatus.appSuccess;
      is_searching = false;
      update();
    }, onError: (e) {
      
      AppSnackBar.show(title: "Error", message: e.toString());
      productStatus = AppStatus.appFailure;
      update();
    });
  }

  Future<bool?> getPaginateProducts(dynamic next, int index, ) async {
    await _produitService.getPaginateProduits(
      next: next,
      onSuccess: (data) {
        update();
        categoriesList[index].produitModel!.next = data.next;
        categoriesList[index].produitModel!.produits!.addAll(data.produits!);
        update();
        return true;
      }, onError: (e) {
        update();
        return false;
      }
    );
  }
  
}
