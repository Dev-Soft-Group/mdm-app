import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/publication_model.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';
import 'package:mdmscoops/services/remote_services/publications/publication.dart';

class ProduitController extends GetxController {
  final ProduitService _produitService = ProduitServiceImpl();
  final PublicationService _publisherService = PublicationServiceImpl();
  AppStatus publicationStatus = AppStatus.appDefault;

  List<Publication> publicationsList = [];

  int selectedTabs = 0;

  List menus = [
    "Tous",
    "Secteurs",
    "Entreprises",
    "Produits",
    "Services",
  ];

  @override
  void onInit() async {
    await getAllPublications();
    super.onInit();
  }

  void onTabChange(int index) {
    selectedTabs = index;
    update();
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
}
