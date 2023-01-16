import 'dart:io';

import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/commentaire_model.dart';
import 'package:mdmscoops/models/response_model/publication_model.dart';
import 'package:mdmscoops/services/remote_services/commentaires/commentaire_service.dart';
import 'package:mdmscoops/services/remote_services/commentaires/commentaire_service_impl.dart';
import 'package:mdmscoops/services/remote_services/publications/publication.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicationDetailController extends GetxController {
  final PublicationService _publicationService = PublicationServiceImpl();

  final CommentairesService _commentaireService = CommentairesServiceImpl();

  List<Commentaire>? commentaires;

  AppStatus publicationStatus = AppStatus.appDefault;

  String idPublication = "";
  Publication? publication;

  @override
  void onInit() async {
    idPublication = Get.arguments["idPublication"].toString();
    await getPublicationById();
    await getAllCommentForPublication();
    super.onInit();
  }

  Future getPublicationById() async {
    publicationStatus = AppStatus.appLoading;
    update();
    await _publicationService.getPublicationById(
        idPublication: idPublication,
        onSuccess: (data) {
          publication = data;
          publicationStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data["message"].toString());
          publicationStatus = AppStatus.appFailure;
          update();
        });
  }

  Future<void> sendWhatsAppMessenger() async {
    var number = "+237652310829";
    String message =
        "Bonjour M./Mme\nJe vous contacte depuis la plateforme mobile MDM SCOOPS\n\nJ'éprouve un intérêt particulier pour le produit: ${publication!.titre.toString().toUpperCase()} trouvé sur la plateforme";
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

  Future getAllCommentForPublication() async {
    publicationStatus = AppStatus.appLoading;
    update();
    await _commentaireService.getAllCommentForPublication(
        idPublication: idPublication,
        onSuccess: (data) {
          commentaires = data.commentaires;
          publicationStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data["message"].toString());
          publicationStatus = AppStatus.appFailure;
          update();
        });
  }
}
