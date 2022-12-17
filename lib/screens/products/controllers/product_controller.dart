// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_field, body_might_complete_normally_nullable

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/categorie_model.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/services/remote_services/categorie/categorie.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductController extends GetxController {
  AppStatus productStatus = AppStatus.appDefault;
  final CategorieService _categorieService = CategorieServiceImpl();

  final ProduitService _produitService = ProduitServiceImpl();

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
      url: next,
      pageSize: 3.toString(),
      onSuccess: (data) {
      _count = data.count!;
      next = data.next;
      previous = data.previous;
      categoriesList.addAll(data.categories!);
      productStatus = AppStatus.appSuccess;
      is_searching = false;
      update();
    }, onError: (e) {
      AppSnackBar.show(title: "Error", message: e.response!.data["message"].toString());
      productStatus = AppStatus.appFailure;
      update();
    });
  }

  Future<bool?> getPaginateProducts(dynamic next, int index) async {
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

   Future<void> sendWhatsAppMessenger(Produit produit) async {
    var number = "+237652310829";
    String message =
        "Bonjour M./Mme\nJe vous contacte depuis la plateforme mobile MDM SCOOPS\n\nJ'éprouve un intérêt particulier pour le produit: ${produit.nom.toString().toUpperCase()} trouvé sur la plateforme";
    var whatsappUrlAndroid = "whatsapp://send?phone=$number&text=$message";
    var whatsappUrlIOS = "https://wa.me/$number?text=$message";

    if (Platform.isAndroid) {
      try {
        await launchUrl(Uri.parse(whatsappUrlAndroid));
      } catch (e) {
        AppSnackBar.show(
            title: "Error",
            message: "WhatsApp n'est pas installé sur votre téléphone !");
      }
    } else {
      if (await canLaunchUrl(Uri.parse(whatsappUrlIOS))) {
        await launchUrl(Uri.parse(whatsappUrlIOS));
      } else {
        AppSnackBar.show(
            title: "Error",
            message: "WhatsApp n'est pas installé sur votre téléphone !");
      }
    }
  }
}
