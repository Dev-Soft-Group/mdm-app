import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/models/response_model/publication_model.dart';
import 'package:mdmscoops/services/remote_services/likes/likes.dart';
import 'package:mdmscoops/services/remote_services/publications/publication.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicationsController extends GetxController {
  final PublicationService _publisherService = PublicationServiceImpl();

  AppStatus publicationStatus = AppStatus.appDefault;

  final LikesService _likesService = LikesServiceImpl();

  List<Publication> publicationsList = [];
  List<Publication> publicationsListCopy = [];
  List<Produit> produitsList = [];

  TextEditingController searchText = TextEditingController();

  int selectedTabs = 0;

  List menus = [
    {
      "id": -1,
      "libelle": "Tous",
    },
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
    super.onInit();
  }

  void onTabChange(int index) async {
    selectedTabs = index;
    publicationsList.clear();
    update();
    if (selectedTabs == 0) {
      publicationsList.addAll(publicationsListCopy);
      update();
      return;
    }
    await getAllPublicationsByType();
  }

  Future searchAllEntreprises({String? value}) async {
    searchText.text = value ?? "";
    publicationStatus = AppStatus.appLoading;
    update();
    await _publisherService.searchAllPublications(
        data: {"search": searchText.text},
        onSuccess: (data) {
          publicationsList = data.publications!;
          publicationStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          publicationStatus = AppStatus.appFailure;
          update();
        });
  }

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

  Future getAllPublicationsByType() async {
    publicationStatus = AppStatus.appLoading;
    update();
    await _publisherService.getAllPublicationsByType(
        data: {
          "type":
              menus[selectedTabs]['id'] >= 0 ? [menus[selectedTabs]['id']] : []
        },
        onSuccess: (data) {
          publicationsList = data.publications!;
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

  Future likerPublication(int index) async {
    await _likesService.likerPublication(
        idPublication: publicationsList[index].id.toString(),
        onSuccess: (data) {
          publicationsList[index].likes = publicationsList[index].likes! + data['results'] as int;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data["message"].toString());
          update();
        });
  }

  Future<void> sendWhatsAppMessenger(Publication publication) async {
    var number = publication.entreprise!.telephone;
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
