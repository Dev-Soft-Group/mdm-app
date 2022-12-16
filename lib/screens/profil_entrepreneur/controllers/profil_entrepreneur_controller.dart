import 'dart:io';

import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/publication_model.dart';
import 'package:mdmscoops/services/remote_services/publications/publication.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilEntrepreneurController extends GetxController{

  final PublicationService _publisherService = PublicationServiceImpl();
  AppStatus publicationStatus = AppStatus.appDefault;

  List<Publication> publicationsList = [];
  
  int selectedTabs = 0;

  List menus = [
    "Publications",
    "Secteurs",
    "Entreprises",
    "Produits",
    "Services",
  ];

  void onTabChange(int index) {
    selectedTabs = index;
    update();
  }

  @override
  void onInit() async {
    await getAllPublications();
    super.onInit();
  }



  Future getAllPublications() async {
    publicationStatus = AppStatus.appLoading;
    update();
    await _publisherService.getAllPublications(onSuccess: (data) {
      publicationsList.addAll(data.publications!);
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