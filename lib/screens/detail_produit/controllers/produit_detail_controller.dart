import 'dart:io';

import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';
import 'package:url_launcher/url_launcher.dart';

class ProduitDetailController extends GetxController {
  final ProduitService _produitService = ProduitServiceImpl();

  AppStatus productStatus = AppStatus.appDefault;

  String idProduit = "";
  Produit? produit;

  @override
  void onInit() async {
    idProduit = Get.arguments["idProduit"].toString();
    await getProductById();
    super.onInit();
  }

  Future getProductById() async {
    productStatus = AppStatus.appLoading;
    update();
    await _produitService.getProduitById(
        productId: idProduit,
        onSuccess: (data) {
          produit = data;
          productStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data["message"].toString());
          productStatus = AppStatus.appFailure;
          update();
        });
  }


  

  Future<void> sendWhatsAppMessenger() async {
    var number = "+237652310829";
    String message =
        "Bonjour M./Mme\nJe vous contacte depuis la plateforme mobile MDM SCOOPS\n\nJ'éprouve un intérêt particulier pour le produit: ${produit!.nom.toString().toUpperCase()} trouvé sur la plateforme";
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

  void updateProduct() {
    Get.toNamed(AppRoutes.CREATE_PRODUITS , arguments: { "produit": produit! });
  }
}
