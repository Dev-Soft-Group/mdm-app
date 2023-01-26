// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, empty_catches

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as client;
import 'package:image_picker/image_picker.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/categorie/categorie.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';
import 'package:path/path.dart';

class ProduitFormController extends GetxController {
  final CategorieService _categorieService = CategorieServiceImpl();
  final ProduitService _produitService = ProduitServiceImpl();

  final LocalAuthService _localService = LocalAuthServiceImpl();

  AppStatus produitFormStatus = AppStatus.appDefault;

  TextEditingController textEditingNomProduit = TextEditingController();
  TextEditingController textEditingDescriptionProduit = TextEditingController();
  TextEditingController textEditingPrixProduit = TextEditingController();
  TextEditingController textEditingCategorieProduit = TextEditingController();

  String selectedCategory = "Aucun";

  var picker = ImagePicker();
  var photo;
  var imageFile;

  Produit? produit;

  @override
  void onInit() async {
    await getCategories();
    try {
      produit = Get.arguments["produit"];
      getArguments();
    } catch (e) {
      produit = null;
    }

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
        if (produit != null) {
          checkedProduit();
        }
      }
      update();
    }, onError: (e) {
      AppSnackBar.show(
          title: "Erreur", message: e.response!.data["message"].toString());
      update();
    });
  }

  void checkedProduit() {
    try {
      selectedCategory = categories.firstWhere(
          (element) => element['id'] == produit!.categorie!)["libelle"];
    } catch (e) {}
  }

  void onChangeCategory(data) {
    selectedCategory = data;
    update();
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

  Future save() async {
    if (textEditingNomProduit.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur", message: "Entrez le nom du produit svp !");
      return;
    }
    if (textEditingDescriptionProduit.text.isEmpty) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Donnez une petite description de votre produit svp !");
      return;
    }
    if (imageFile == null && produit == null) {
      AppSnackBar.show(
          title: "Erreur",
          message: "Veuillez fournir une image pour votre produit !");
      return;
    }
    produitFormStatus = AppStatus.appLoading;
    update();
    if (produit != null) {
      await updateProduit();
      return;
    }
    client.FormData formData = client.FormData.fromMap({
      "idEntreprise": await _localService.getEntrepriseId(),
      "nom": textEditingNomProduit.text.trim(),
      "description": textEditingDescriptionProduit.text.trim(),
      "prix": int.parse(textEditingPrixProduit.text.trim()),
      "categorie": categories.firstWhere(
          (element) => element['libelle'] == selectedCategory)['id'],
      "image": imageFile != null
          ? await client.MultipartFile.fromFile(imageFile!.path!,
              filename: basename(imageFile!.path!))
          : null,
    });

    await _produitService.addProduit(
        data: formData,
        onSuccess: (data) {
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          produitFormStatus = AppStatus.appSuccess;
          clearForm();
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          produitFormStatus = AppStatus.appFailure;
          update();
        });
  }

  void clearForm() {
    textEditingNomProduit.clear();
    textEditingDescriptionProduit.clear();
    textEditingPrixProduit.clear();
    imageFile = null;
  }

  Future<void> updateProduit() async {
    client.FormData formData = client.FormData.fromMap({
      "id": produit!.id!.toString(),
      "nom": textEditingNomProduit.text.trim(),
      "description": textEditingDescriptionProduit.text.trim(),
      "prix": textEditingPrixProduit.text.trim().isNotEmpty ? int.parse(textEditingPrixProduit.text.trim()) : 0,
      "categorie": categories.firstWhere(
          (element) => element['libelle'] == selectedCategory)['id'],
      "image": imageFile != null
          ? await client.MultipartFile.fromFile(imageFile!.path!,
              filename: basename(imageFile!.path!))
          : null,
      "utilisateur": produit!.utilisateur!,
    });
    await _produitService.updateProduit(
        data: formData,
        idProduit: produit!.id!.toString(),
        onSuccess: (data) {
          Get.back();
          AppSnackBar.show(
              title: "Succès",
              message: data["message"].toString(),
              backColor: kBlackColor);
          produitFormStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          produitFormStatus = AppStatus.appFailure;
          update();
        });
  }

  void getArguments() {
    textEditingNomProduit.text = produit!.nom!.toString().capitalizeFirst!;
    textEditingPrixProduit.text = produit!.prix!.toString();
    textEditingDescriptionProduit.text = produit!.description!.toString();
  }

  
}
