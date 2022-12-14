import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart' as client;
import 'package:image_picker/image_picker.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';
import 'package:mdmscoops/services/remote_services/secteur_activite/secteur_activite.dart';

class CompteController extends GetxController {
  final SecteurActiviteService _secteurActiviteService =
      SecteurActiviteServiceImpl();
  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();

  AppStatus entrepriseStatus = AppStatus.appDefault;
  AppStatus succursaleStatus = AppStatus.appDefault;

  String selectedSecteur = "Aucun";
  String selectedEntreprise = "Aucune";

  TextEditingController textEditingNom = TextEditingController();
  TextEditingController textEditingEmail = TextEditingController();
  TextEditingController textEditingSiegeSocial = TextEditingController();
  TextEditingController textEditingTelephone = TextEditingController();
  TextEditingController textEditingSiteWeb = TextEditingController();
  TextEditingController textEditingPageSociale = TextEditingController();
  TextEditingController textEditingDescription = TextEditingController();
  TextEditingController textEditingLocalisation = TextEditingController();

  List<Map<String, dynamic>> secteurs = [
    {'id': '-1', "libelle": "Aucun"},
  ];

  List<Map<String, dynamic>> entreprises = [
    {'id': '-1', "libelle": "Aucune"},
  ];

  var picker = ImagePicker();
  var logo;
  var imageFile;

  List<String> webSites = [];
  List<String> pagesSociales = [];

  @override
  void onInit() async {
    await getAllSecteurs();
    await getAllEntrepises();
    super.onInit();
  }

  void onChangeSecteur(data) {
    selectedSecteur = data;
    update();
  }

  void onChangeEntreprise(data) {
    selectedEntreprise = data;
    update();
  }

  void addWebSite() {
    if (!GetUtils.isURL(textEditingSiteWeb.text)) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer un lien au format correct !");
      return;
    }
    webSites = [
      (textEditingSiteWeb.text.trim().startsWith("http://") ||
              textEditingSiteWeb.text.trim().startsWith("https://"))
          ? textEditingSiteWeb.text.trim()
          : "https://${textEditingSiteWeb.text.trim()}",
      ...webSites
    ];
    textEditingSiteWeb.clear();
    update();
  }

  void removeWebSiteByIndex(int i) {
    webSites.removeAt(i);
    update();
  }

  void addPageSociale() {
    if (!GetUtils.isURL(textEditingSiteWeb.text)) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer un lien au format correct !");
      return;
    }

    pagesSociales = [
      (textEditingPageSociale.text.trim().startsWith("http://") ||
              textEditingPageSociale.text.trim().startsWith("https://"))
          ? textEditingPageSociale.text.trim()
          : "https://${textEditingPageSociale.text.trim()}",
      
      ...pagesSociales];
    textEditingPageSociale.clear();
    update();
  }

  void removePageSocialeByIndex(int i) {
    pagesSociales.removeAt(i);
    update();
  }

  Future getAllSecteurs() async {
    await _secteurActiviteService.getAllSecteurActivite(onSuccess: (data) {
      for (SecteurActivite map in data.secteurActivites!) {
        secteurs.add({"id": map.id!, "libelle": map.nom!});
      }
      if (secteurs.length > 1) {
        selectedSecteur = secteurs[1]['libelle'];
        secteurs.removeAt(0);
        secteurs.sort((a, b) => a['libelle'].compareTo(b['libelle']));
      }
      update();
    }, onError: (e) {
      AppSnackBar.show(
          title: "Erreur", message: e.response!.data["message"].toString());
      update();
    });
  }

  Future getAllEntrepises() async {
    entrepriseStatus = AppStatus.appLoading;
    update();
    await _entrepriseService.getAllEntreprisesForUser(onSuccess: (data) {
      for (Map map in data["results"]) {
        entreprises.add({"id": map["id"], "libelle": map["nom"]});
      }
      if (entreprises.length > 1) {
        selectedEntreprise = entreprises[1]['libelle'];
        entreprises.removeAt(0);
        entreprises.sort((a, b) => a['libelle'].compareTo(b['libelle']));
      }
      entrepriseStatus = AppStatus.appSuccess;
      update();
    }, onError: (e) {
      AppSnackBar.show(
          title: "Erreur", message: e.response!.data["message"].toString());
      entrepriseStatus = AppStatus.appFailure;
      update();
    });
  }

  Future saveSuccursale() async {
    if (textEditingNom.text.trim().isEmpty) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer le nom de la succursale svp !");
      return;
    }

    if (!GetUtils.isEmail(textEditingEmail.text.trim())) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer un numéro de téléphone valide !");
      return;
    }
    if (textEditingLocalisation.text.trim().isEmpty) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez renseigner la localisattion de la succursale.");
      return;
    }

    if (!GetUtils.isPhoneNumber(textEditingTelephone.text.trim())) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer une adresse email valide !");
      return;
    }
    if (entreprises[0]['id'] == '-1') {
      AppSnackBar.show(
          title: "Erreur",
          message: "Vous ne possedez aucune entreprise. Créez en une avant");
      return;
    }

    succursaleStatus = AppStatus.appLoading;
    update();

    client.FormData formData = client.FormData.fromMap({
      "nom": textEditingNom.text.trim(),
      "localisation": textEditingLocalisation.text.trim(),
      "telephone": textEditingTelephone.text.trim(),
      "email": textEditingEmail.text.trim(),
      "entreprise": entreprises.firstWhere(
          (element) => element['libelle'] == selectedEntreprise)['id']
    });

    await _entrepriseService.addSuccursale(
        data: formData,
        onSuccess: (data) {
          Get.back();
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          succursaleStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          succursaleStatus = AppStatus.appSuccess;
          update();
        });
  }

  Future saveEntreprise() async {
    if (textEditingNom.text.trim().isEmpty) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer le nom de votre structure svp !");
      return;
    }

    if (!GetUtils.isEmail(textEditingEmail.text.trim())) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer un numéro de téléphone valide !");
      return;
    }

    if (!GetUtils.isPhoneNumber(textEditingTelephone.text.trim())) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer une adresse email valide !");
      return;
    }

    if (textEditingSiegeSocial.text.trim().isEmpty) {
      AppSnackBar.show(
          title: "Erreur", message: "Veuillez renseigner votre siège social ");
      return;
    }

    if (textEditingDescription.text.trim().isEmpty) {
      AppSnackBar.show(
          title: "Erreur",
          message:
              "Veuillez saisir uyne petite description de votre entreprise.");
      return;
    }

    entrepriseStatus = AppStatus.appLoading;
    update();

    String sites = "";
    for (String string in webSites) {
      sites += sites.isEmpty ? string : ", $string";
    }

    client.FormData formData = client.FormData.fromMap({
      "nom": textEditingNom.text.trim(),
      "siegeSocial": textEditingSiegeSocial.text.trim(),
      "telephone": textEditingTelephone.text.trim(),
      "email": textEditingEmail.text.trim(),
      "logo": imageFile != null
          ? await client.MultipartFile.fromFile(imageFile!.path!,
              filename: p.basename(imageFile!.path!))
          : "",
      "sites": sites,
      "description": textEditingDescription.text.trim(),
    });

    await _entrepriseService.addEntreprise(
        data: formData,
        onSuccess: (data) {
          Get.back();
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          entrepriseStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          entrepriseStatus = AppStatus.appSuccess;
          update();
        });
  }

  Future choseImage(ImageSource source) async {
    XFile? pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      var imageBytes = imageFile.readAsBytesSync();
      var encoded = base64Encode(imageBytes);
      logo = "data:image/png;base64, $encoded";
      update();
    }
  }
}
