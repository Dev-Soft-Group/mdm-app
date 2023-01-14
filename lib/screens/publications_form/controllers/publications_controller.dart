// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, empty_catches
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/screens/profil_entrepreneur/controllers/profil_entrepreneur_controller.dart';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart' as client;
import 'package:image_picker/image_picker.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/publication_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/publications/publication_service.dart';
import 'package:mdmscoops/services/remote_services/publications/publication_service_impl.dart';

class PublicationFormController extends GetxController {
  final LocalAuthService _localAuthService = LocalAuthServiceImpl();

  final PublicationService _publisherService = PublicationServiceImpl();
  final ProfilEntrepreneurController _control = Get.find<ProfilEntrepreneurController>();

  AppStatus publicationFormStatus = AppStatus.appDefault;

  TextEditingController textEditingTitrePublication = TextEditingController();
  TextEditingController textEditingDescriptionPublication =
      TextEditingController();

  String selectedType = "Annonce";

  List<Map<String, dynamic>> entreprises = [
    {'id': "-1", 'libelle': "Aucun"},
  ];

  List<Map<String, dynamic>> typePublications = [
    {'id': 0, 'libelle': "Article"},
    {'id': 1, 'libelle': "Annonce"},
    {'id': 2, 'libelle': "Publicité"},
  ];

  var picker = ImagePicker();
  var photo;
  var imageFile;

  Publication? publication;

  @override
  void onInit() async {
    try {
      publication = Get.arguments['publication'];
      getArguments();
    } catch (e) {}

    super.onInit();
  }

  void getArguments() {
    textEditingTitrePublication.text = publication!.titre!;
    textEditingDescriptionPublication.text = publication!.description!;
    selectedType = typePublications[publication!.type!]["libelle"];
  }

  void onChangeTypePublication(data) {
    selectedType = data;
    update();
  }

  Future updatePublication(client.FormData formData) async  {

     await _publisherService.updatePublication(
        data: formData,
        idPublication: publication!.id!,
        onSuccess: (data) {
          Get.back();
          _control.getAllPublicationsForEnterprise();
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

    client.FormData formData = client.FormData.fromMap({
      "titre": textEditingTitrePublication.text.trim(),
      "description": textEditingDescriptionPublication.text.trim(),
      "type": typePublications
          .firstWhere((element) => element['libelle'] == selectedType)['id'],
      "entreprise": await _localAuthService.getEntrepriseId(),
      "photo": imageFile != null
          ? await client.MultipartFile.fromFile(imageFile!.path!,
              filename: p.basename(imageFile!.path!))
          : "",
    });

    if ( publication != null){
      await updatePublication(formData);
      return;
    }

    await _publisherService.addPublication(
        data: formData,
        onSuccess: (data) {
          Get.back();
          _control.getAllPublicationsForEnterprise();
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

  Future choseImage(ImageSource source) async {
    XFile? pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      var imageBytes = imageFile.readAsBytesSync();
      var encoded = base64Encode(imageBytes);
      photo = "data:image/png;base64, $encoded";
      update();
    }
  }
}
