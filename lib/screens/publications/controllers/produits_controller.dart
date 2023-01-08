import 'dart:io';

import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/categorie_produit_modele.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/models/response_model/publication_model.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';
import 'package:mdmscoops/services/remote_services/publications/publication.dart';
import 'package:url_launcher/url_launcher.dart';

class ProduitController extends GetxController {
  final PublicationService _publisherService = PublicationServiceImpl();

  final ProduitService _produitService = ProduitServiceImpl();

  AppStatus publicationStatus = AppStatus.appDefault;

  List<Publication> publicationsList = [];
  List<Publication> publicationsListCopy = [];
  List<Produit> produitsList = [];

  int selectedTabs = 0;

  List menus = [
    {
      "id": 0,
      "libelle": "Article",
    },
    {
      "id": 1,
      "libelle": "Annonce",
    },
    {
      "id": 2,
      "libelle": "Publicité",
    }
  ];

  @override
  void onInit() async {
    await getAllPublications();
    // await getAllCategorieProduits();
    super.onInit();
  }

  void onTabChange(int index) async {
    selectedTabs = index;
    update();
    if (selectedTabs == 0) {
      // publicationsList = publicationsListCopy;
      update();
      return;
    }
    // await getProduitForCategorie();
  }

  //  Future getProduitForCategorie() async {
  //   publicationStatus = AppStatus.appLoading;
  //   update();
  //   await _produitService.getProduitForCategorie(
  //     idCategory: menus[selectedTabs]["id"],
  //     onSuccess: (data){
  //       produitsList = data.produits!;
  //       print(produitsList);
  //       publicationStatus = AppStatus.appSuccess;
  //       update();
  //     },
  //     onError: (e){
  //       publicationStatus = AppStatus.appFailure;
  //       update();
  //     }
  //   );
  // }

  // Future getAllCategorieProduits() async {
  //   await _produitService.getAllCategorieProduits(onSuccess: (data) {
  //     for (CategorieProduit map in data.categories!) {
  //       menus.add({"id": map.id!, "libelle": map.nom!});
  //     }
  //     update();
  //   }, onError: (e) {
  //     AppSnackBar.show(
  //         title: "Erreur", message: e.response!.data["message"].toString());
  //     update();
  //   });
  // }

  Future getAllPublications() async {
    publicationStatus = AppStatus.appLoading;
    update();
    await _publisherService.getAllPublications(onSuccess: (data) {
      publicationsList.addAll(data.publications!);
      publicationsListCopy = data.publications!;
      publicationStatus = AppStatus.appSuccess;
      update();
    }, onError: (e) {
      AppSnackBar.show(
          title: "Erreur", message: e.response.data['message'].toString());
      publicationStatus = AppStatus.appFailure;
      update();
    });
  }

  Future<void> sendWhatsAppMessenger(Publication publication) async {
    var number = "+237652310829";
    String message =
        "Bonjour M./Mme\nJe vous contacte depuis la plateforme mobile MDM SCOOPS\n\nJ'éprouve un intérêt particulier pour la publication du produit: ${publication.titre.toString().toUpperCase()} trouvé sur la plateforme";
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
