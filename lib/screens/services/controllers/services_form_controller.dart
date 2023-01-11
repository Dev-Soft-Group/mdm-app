// ignore_for_file: empty_catches

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/services_models.dart';
import 'package:mdmscoops/services/remote_services/categorie/categorie.dart';
import 'package:mdmscoops/services/remote_services/services/service.dart';

class ServicesFormController extends GetxController {
  final CategorieService _categorieService = CategorieServiceImpl();
  final ServicesService _servicetService = ServicesServiceImpl();

  AppStatus serviceFormStatus = AppStatus.appDefault;

  TextEditingController textEditingNomService = TextEditingController();
  TextEditingController textEditingDescriptionService = TextEditingController();

  String selectedCategory = "Aucun";

  Service? service;

  @override
  void onInit() async {
    try {
      service = Get.arguments["service"];
      getArguments();
    } catch (e) {
      service = null;
    }
    await getCategoriesServices();
    super.onInit();
  }

  void getArguments() {
    textEditingNomService.text = service!.nom!.toString();
    textEditingDescriptionService.text = service!.description!.toString();
  }

  List<Map<String, dynamic>> categories = [
    {'id': "-1", 'libelle': "Aucun"},
  ];

  Future getCategoriesServices() async {
    await _categorieService.getAllCategoriesServices(onSuccess: (data) {
      for (Map map in data["results"]) {
        categories.add({"id": map["id"], "libelle": map["nom"]});
      }
      if (categories.length > 1) {
        selectedCategory = categories[1]['libelle'];
        categories.removeAt(0);
        categories.sort((a, b) => a['libelle'].compareTo(b['libelle']));
        if (service != null) {
          checkedService();
        }
      }
      update();
    }, onError: (e) {
      AppSnackBar.show(title: "Erreur", message: e.response!.data["message"]);
      update();
    });
  }

  void checkedService() {
    try {
      selectedCategory = categories.firstWhere(
          (element) => element['id'] == service!.categorie!)["libelle"];
    } catch (e) {}
  }

  void onChangeCategory(data) {
    selectedCategory = data;
    update();
  }

  Future save() async {
    if (textEditingNomService.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur", message: "Entrez le nom du service svp !");
      return;
    }

    if (textEditingDescriptionService.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Donnez une petite description de votre service svp !");
      return;
    }
    serviceFormStatus = AppStatus.appLoading;
    update();

    if (service != null) {
      await updateService();
      return;
    }
    var data = {
      "nom": textEditingNomService.text.trim(),
      "description": textEditingDescriptionService.text.trim(),
      "categorie": categories.firstWhere(
          (element) => element['libelle'] == selectedCategory)['id'],
    };

    await _servicetService.addService(
        data: data,
        onSuccess: (data) {
          Get.back();
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

  Future updateService() async {
    var data = {
      "id": service!.id!.toString(),
      "nom": textEditingNomService.text.trim(),
      "description": textEditingDescriptionService.text.trim(),
      "utilisateur": service!.utilisateur,
      "categorie": categories.firstWhere(
          (element) => element['libelle'] == selectedCategory)['id'],
    };
    await _servicetService.updateService(
        data: data,
        idService: service!.id!.toString(),
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
