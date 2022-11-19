

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/services/remote_services/categorie/categorie.dart';
import 'package:mdmscoops/services/remote_services/services/service.dart';

class ServicesFormController extends GetxController{

final CategorieService _categorieService = CategorieServiceImpl();
  final ServicesService _servicetService = ServicesServiceImpl();

  AppStatus serviceFormStatus = AppStatus.appDefault;

  TextEditingController textEditingNomProduit = TextEditingController();
  TextEditingController textEditingDescriptionProduit = TextEditingController();
  TextEditingController textEditingCategorieProduit = TextEditingController();

  String selectedCategory = "Aucun";

  @override
  void onInit() async {
    await getCategories();
    super.onInit();
  }

  List<Map<String, dynamic>> categories = [
    {'id': "-1", 'libelle': "Aucun"},
  ];

  Future getCategories() async {
    await _categorieService.getAllCategories(onSuccess: (data) {
      for (Map map in data["results"]) {
        categories.add({"id": map["id"], "libelle": map["nom"]});
      }
      if (categories.length > 1) {
        selectedCategory = categories[1]['libelle'];
        categories.removeAt(0);
        categories.sort((a, b) => a['libelle'].compareTo(b['libelle']));
      }
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  }

  void onChangeCategory(data) {
    selectedCategory = data;
    update();
  }

  Future save() async {
    if (textEditingNomProduit.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur", message: "Entrez le nom du service svp !");
      return;
    }

    if (textEditingDescriptionProduit.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur", message: "Donnez une petite description de votre service svp !");
      return;
    }
    serviceFormStatus = AppStatus.appLoading;
    update();
    var data = {
      "nom": textEditingNomProduit.text.trim(),
      "description": textEditingNomProduit.text.trim(),
      "categorie": categories.firstWhere(
          (element) => element['libelle'] == selectedCategory)['id'],
    };
    await _servicetService.addService(
        data: data,
        onSuccess: (data) {
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          serviceFormStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          serviceFormStatus = AppStatus.appFailure;
          update();
        });
  }

}