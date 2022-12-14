
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/services/remote_services/produits/produits.dart';
import 'package:mdmscoops/services/remote_services/publications/publication.dart';

class ProduitController extends GetxController{

  final ProduitService _produitService = ProduitServiceImpl();
  final PublicationService _publisherService = PublicationServiceImpl();
  AppStatus produitStatus = AppStatus.appDefault;

  List<Produit> produitsList = [];

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


  Future getAllProduits() async {

    produitStatus = AppStatus.appLoading;
    update();

    await _produitService.getAllProduits(
      onSuccess: (data) {
        print(data.toMap());
        produitStatus = AppStatus.appSuccess;
        update();
      },
      onError: (e) {
        AppSnackBar.show(title:"Erreur", message:e.toString());
        produitStatus = AppStatus.appFailure;
        update();
      }
    );
  }

  Future getAllPublications() async {

    produitStatus = AppStatus.appLoading;
    update();

    await _publisherService.getAllPublications(
      onSuccess: (data) {
        print(data.toMap());
        produitStatus = AppStatus.appSuccess;
        update();
      },
      onError: (e) {
        print(e.toString());
        AppSnackBar.show(title:"Erreur", message:e.toString());
        produitStatus = AppStatus.appFailure;
        update();
      }
    );
  }
}