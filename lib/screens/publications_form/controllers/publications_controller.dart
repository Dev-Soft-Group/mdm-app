// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';
import 'package:mdmscoops/services/remote_services/publications/publication_service.dart';
import 'package:mdmscoops/services/remote_services/publications/publication_service_impl.dart';

class PublicationFormController extends GetxController {
  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();

  final PublicationService _publisherService = PublicationServiceImpl();

  AppStatus publicationFormStatus = AppStatus.appDefault;

  TextEditingController textEditingTitrePublication = TextEditingController();
  TextEditingController textEditingDescriptionPublication = TextEditingController();

  String selectedEntreprise = "Aucun";
  String selectedType = "Annonce";

  @override
  void onInit() async {
    await getEntreprises();
    super.onInit();
  }

  List<Map<String, dynamic>> entreprises = [
    {'id': "-1", 'libelle': "Aucun"},
  ];

  List<Map<String, dynamic>> typePublications = [
    {'id': 0, 'libelle': "Article"},
    {'id': 1, 'libelle': "Annonce"},
    {'id': 2, 'libelle': "Publicité"},
  ];

  Future getEntreprises() async {
    await _entrepriseService.getAllEntreprises(onSuccess: (data) {
      for (Entreprise film in data.entreprises!) {
        entreprises.add({"id": film.id!, "libelle": film.nom!});
      }
      if (entreprises.length > 1) {
        selectedEntreprise = entreprises[1]['libelle'];
        entreprises.removeAt(0);
        entreprises.sort((a, b) => a['libelle'].compareTo(b['libelle']));
      }
      update();
    }, onError: (e) {
      AppSnackBar.show(
          title: "Erreur", message: e.response!.data["message"].toString());
      update();
    });
  }

  void onChangeEntreprise(data) {
    selectedEntreprise = data;
    update();
  }

  void onChangeTypePublication(data) {
    selectedType = data;
    update();
  }

  Future save() async {
    if (textEditingTitrePublication.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur", message: "Entrez le titre de la publication !");
      return;
    }
    if (textEditingDescriptionPublication.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Donnez une description à cette publication svp !");
      return;
    }
    publicationFormStatus = AppStatus.appLoading;
    update();

    var data = {
      "titre": textEditingTitrePublication.text.trim(),
      "description": textEditingDescriptionPublication.text.trim(),
      "type": typePublications.firstWhere((element) => element['libelle'] == selectedType)['id'],
      "entreprise": entreprises.firstWhere(
          (element) => element['libelle'] == selectedEntreprise)['id'],
    };
    await _publisherService.addPublication(
        data: data,
        onSuccess: (data) {
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          publicationFormStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          publicationFormStatus = AppStatus.appFailure;
          update();
        });
  }
}
