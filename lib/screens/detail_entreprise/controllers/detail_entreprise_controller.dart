// ignore_for_file: avoid_print

import 'dart:io';

import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/models/response_model/services_models.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise.dart';
import 'package:mdmscoops/services/remote_services/services/service.dart';
import 'package:url_launcher/url_launcher.dart';

class EntrepriseDetailController extends GetxController {
  final EntrepriseService _entrepriseService = EntrepriseServiceImpl();

  final ServicesService _serviceService = ServicesServiceImpl();

  AppStatus entrepriseStatus = AppStatus.appDefault;
  AppStatus servicesStatus = AppStatus.appDefault;

  Entreprise? entreprise;

  List<String> siteWeb = [];
  List<Service> servicesList = [];

  @override
  void onInit() async {
    await getEntrepriseById();
    await getAllServicesForMy();
    update();
    super.onInit();
  }

  Future getAllServicesForMy() async {
    servicesStatus = AppStatus.appLoading;
    update();
    await _serviceService.getAllServicesForMy(
      idEntreprise: Get.arguments["idEntreprise"],
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

  Future<void> getEntrepriseById() async {
    entrepriseStatus = AppStatus.appLoading;
    update();


    await _entrepriseService.getEntrepriseById(
        idEntreprise: Get.arguments["idEntreprise"],
        onSuccess: (data) {
          entreprise = data;
          siteWeb = entreprise!.sites!.split(", ");
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

  Future<void> sendWhatsAppMessenger() async {
    var number = entreprise!.telephone!;
    String message =
        "Bonjour M./Mme\nJe vous contacte depuis la plateforme mobile MDM SCOOPS";
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
