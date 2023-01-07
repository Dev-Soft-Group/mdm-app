// ignore_for_file: prefer_typing_uninitialized_variables, empty_catches

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/models/response_model/corps_metier_model.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/models/response_model/succursale_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/corps_metier/corps_metier.dart';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart' as client;
import 'package:image_picker/image_picker.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';

class CompteController extends GetxController {
  final CorpsMetierService _corpsMetiers = CorpsMetierServiceImpl();
  
  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();
  final LocalAuthService _localService = LocalAuthServiceImpl();

  AppStatus entrepriseStatus = AppStatus.appDefault;
  AppStatus succursaleStatus = AppStatus.appDefault;

  String selectedCorps = "Aucun";
  String selectedEntreprise = "Aucune";

  TextEditingController textEditingNom = TextEditingController();
  TextEditingController textEditingEmail = TextEditingController();
  TextEditingController textEditingSiegeSocial = TextEditingController();
  TextEditingController textEditingTelephone = TextEditingController();
  TextEditingController textEditingSiteWeb = TextEditingController();
  TextEditingController textEditingPageSociale = TextEditingController();
  TextEditingController textEditingDescription = TextEditingController();
  TextEditingController textEditingLocalisation = TextEditingController();

  List<Map<String, dynamic>> corpsM = [
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

  var countryCode;

  Entreprise? entreprise;
  Succursale? succursale;

  @override
  void onInit() async {
    try {
      entreprise = Get.arguments["entreprise"];
      getArguments();
    } catch (e) {}
    try {
      succursale = Get.arguments["succursale"];
      getSuccursaleArguments();
    } catch (e) {}
    await getAllCorpsMetiers();
    super.onInit();
  }

  void getArguments() {
    textEditingNom.text = entreprise!.nom!.toString();
    textEditingEmail.text = entreprise!.email.toString();
    textEditingSiegeSocial.text = entreprise!.siegeSocial.toString();
    textEditingTelephone.text = entreprise!.telephone!.toString();
    textEditingDescription.text = entreprise!.description!.toString();
    webSites = entreprise!.sites!.split(", ");
  }

  void getSuccursaleArguments() {
    textEditingNom.text = succursale!.nom!.toString();
    textEditingEmail.text = succursale!.email.toString();
    textEditingLocalisation.text = succursale!.localisation.toString();
    textEditingTelephone.text = succursale!.telephone!.toString();
  }

  void onChangeCorpsM(data) {
    selectedCorps = data;
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
      ...pagesSociales
    ];
    textEditingPageSociale.clear();
    update();
  }

  void removePageSocialeByIndex(int i) {
    pagesSociales.removeAt(i);
    update();
  }

  Future getAllCorpsMetiers() async {
    await _corpsMetiers.getAllCorpsMetier(onSuccess: (data) {
      for (CorpsMetier map in data.corpsMetiers!) {
        corpsM.add({"id": map.id!, "libelle": map.nom!});
      }
      if (corpsM.length > 1) {
        selectedCorps = corpsM[1]['libelle'];
        corpsM.removeAt(0);
        corpsM.sort((a, b) => a['libelle'].compareTo(b['libelle']));
      }
      update();
    }, onError: (e) {
      AppSnackBar.show(
          title: "Erreur", message: e.response!.data["message"].toString());
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

    succursaleStatus = AppStatus.appLoading;
    update();

    if (succursale != null) {
      await updateSuccursale();
      return;
    }

    client.FormData formData = client.FormData.fromMap({
      "nom": textEditingNom.text.trim(),
      "localisation": textEditingLocalisation.text.trim(),
      "telephone": countryCode == null
          ? "+237${textEditingTelephone.text.trim()}"
          : "${countryCode!.dialCode!}${textEditingTelephone.text.trim()}",
      "email": textEditingEmail.text.trim(),
      "entreprise": await _localService.getEntrepriseId()
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

  Future updateSuccursale() async {
    client.FormData formData = client.FormData.fromMap({
      "nom": textEditingNom.text.trim(),
      "localisation": textEditingLocalisation.text.trim(),
      "telephone": textEditingTelephone.text.trim(),
      "email": textEditingEmail.text.trim(),
      "entreprise": succursale!.entreprise!.toString(),
    });

    await _entrepriseService.updateSuccursale(
        data: formData,
        idSuccursale: succursale!.id.toString(),
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
          message: "Veuillez entrer une adresse email valide !");

      return;
    }

    if (!GetUtils.isPhoneNumber(textEditingTelephone.text.trim())) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez entrer un numéro de téléphone valide !");
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
              "Veuillez saisir une petite description de votre entreprise.");
      return;
    }

    entrepriseStatus = AppStatus.appLoading;
    update();

    String sites = "";
    for (String string in webSites) {
      sites += sites.isEmpty ? string : ", $string";
    }

    if (entreprise != null) {
      await updateEntreprise(sites);
      return;
    }

    client.FormData formData = client.FormData.fromMap({
      "corpsMetier": corpsM
          .firstWhere((element) => element["libelle"] == selectedCorps)['id'],
      "nom": textEditingNom.text.trim(),
      "siegeSocial": textEditingSiegeSocial.text.trim(),
      "telephone": countryCode == null
          ? "+237${textEditingTelephone.text.trim()}"
          : "${countryCode!.dialCode!}${textEditingTelephone.text.trim()}",
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

  Future updateEntreprise(String sites) async {
    client.FormData formData = client.FormData.fromMap({
      "id": entreprise!.id!.toString(),
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
      "utilisateur": entreprise!.utilisateur!
    });

    await _entrepriseService.updateEntreprise(
        data: formData,
        idEntreprise: entreprise!.id!.toString(),
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
