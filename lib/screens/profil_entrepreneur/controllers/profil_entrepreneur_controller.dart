import 'dart:io';

import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/models/response_model/publication_model.dart';
import 'package:mdmscoops/models/response_model/services_models.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';
import 'package:mdmscoops/services/remote_services/likes/likes.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';
import 'package:mdmscoops/services/remote_services/publications/publication.dart';
import 'package:mdmscoops/services/remote_services/services/service.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilEntrepreneurController extends GetxController {
  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();
  final LocalAuthService _localService = LocalAuthServiceImpl();

  final ProduitService _produitService = ProduitServiceImpl();

  final LikesService _likesService = LikesServiceImpl();

  final ServicesService _serviceService = ServicesServiceImpl();
  final LocalAuthService _authService = LocalAuthServiceImpl();

  AppStatus entrepriseStatus = AppStatus.appDefault;
  AppStatus servicesStatus = AppStatus.appDefault;

  Entreprise? entreprise;

  final PublicationService _publisherService = PublicationServiceImpl();
  AppStatus publicationStatus = AppStatus.appDefault;
  AppStatus produitStatus = AppStatus.appDefault;

  List<Publication> publicationsList = [];
  List<Produit> produitsList = [];
  List<Service> servicesList = [];

  int selectedTabs = 0;

  List menus = [
    "Publications",
    "Produits",
    "Succursales",
    "Services",
    // "Secteurs",
    // "Entreprises",
  ];

  void onTabChange(int index) async {
    selectedTabs = index;
    if (selectedTabs == 3){
      await getAllServicesForMy();
    }
    update();
  }

  @override
  void onInit() async {
    await getEntrepriseById();
    await getAllPublicationsForEnterprise();
    await getAllProduitsForEnterprise();
    super.onInit();
  }

  Future likerPublication(int index) async {
    await _likesService.likerPublication(
        idPublication: publicationsList[index].id.toString(),
        onSuccess: (data) {
          publicationsList[index].likes =
              publicationsList[index].likes! + data['results'] as int;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data["message"].toString());
          update();
        });
  }

  Future getAllServicesForMy() async {
    servicesStatus = AppStatus.appLoading;
    update();
    await _serviceService.getAllServicesForMy(
      idEntreprise: await _authService.getEntrepriseId(),
      onSuccess: (data) {
      servicesList = data.services!;
      servicesStatus = AppStatus.appSuccess;
      update();
    }, onError: (e) {
      AppSnackBar.show(title: "Error", message: e.response!.data["message"]);
      servicesStatus = AppStatus.appFailure;
      update();
    });
  }


   Future likerProduit(int index) async {
    await _likesService.likerProduit(
        idProduit: produitsList[index].id.toString(),
        onSuccess: (data) {
          produitsList[index].likes =
              produitsList[index].likes! + data['results'] as int;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data["message"].toString());
          update();
        });
  }

  Future<void> getEntrepriseById() async {
    entrepriseStatus = AppStatus.appLoading;
    update();
    await _entrepriseService.getEntrepriseById(
        idEntreprise: await _localService.getEntrepriseId(),
        onSuccess: (data) {
          entreprise = data;
          // siteWeb = entreprise!.sites!.split(", ");
          entrepriseStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response!.data["message"].toString());
          entrepriseStatus = AppStatus.appFailure;
          update();
        });
  }

  Future getAllProduitsForEnterprise() async {
    produitStatus = AppStatus.appLoading;
    update();
    await _produitService.getAllProduitsForEnterprise(
        idEntreprise: await _localService.getEntrepriseId(),
        onSuccess: (data) {
          produitsList.addAll(data.produits!);
          produitStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response.data['message'].toString());
          produitStatus = AppStatus.appFailure;
          update();
        });
  }

  Future getAllPublicationsForEnterprise() async {
    publicationStatus = AppStatus.appLoading;
    update();
    await _publisherService.getAllPublicationsForEnterprise(
        idEntreprise: await _localService.getEntrepriseId(),
        onSuccess: (data) {
          publicationsList.clear();
          publicationsList.addAll(data.publications!);
          publicationStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Erreur", message: e.response.data['message'].toString());
          publicationStatus = AppStatus.appFailure;
          update();
        });
  }

  Future<void> sendWhatsAppMessenger(Publication publication) async {
    var number = publication.entreprise!.telephone!;
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

  Future<void> sendWhatsAppMessengerProduit(Produit produit) async {
    var number = produit.entreprises!.first.telephone;
    String message =
        "Bonjour M./Mme\nJe vous contacte depuis la plateforme mobile MDM SCOOPS\n\nJ'éprouve un intérêt particulier pour la publication du produit: ${produit.nom.toString().toUpperCase()} trouvé sur la plateforme";
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

  void switchList(value) {
    switch (value) {
      case 0:
        Get.toNamed(AppRoutes.COMPTEENTREPRISE,
            arguments: {"entreprise": entreprise!});
        break;
      case 1:
        Get.toNamed(AppRoutes.CREATE_PRODUITS);
        break;
      case 2:
        Get.toNamed(AppRoutes.CREATE_SERVICE);
        break;
      case 3:
        Get.toNamed(AppRoutes.ENTREPRISE_SUCCURSALE);
        break;
      case 4:
        Get.toNamed(AppRoutes.CREATE_PUBLICAION);
        break;
      default:
    }
  }
}
