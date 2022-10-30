import 'package:get/route_manager.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/compte/bindings/compte_binding.dart';
import 'package:mdmscoops/screens/compte/views/compte_view.dart';
import 'package:mdmscoops/screens/connexion/bindings/connexion_binding.dart';
import 'package:mdmscoops/screens/connexion/views/connexion_view.dart';
import 'package:mdmscoops/screens/detail_entreprise/bindings/detail_entreprise_binding.dart';
import 'package:mdmscoops/screens/detail_entreprise/views/detail_entreprise_view.dart';
import 'package:mdmscoops/screens/detail_produit/bindings/produit_detal_binding.dart';
import 'package:mdmscoops/screens/detail_produit/views/produit_detail_view.dart';
import 'package:mdmscoops/screens/detail_secteur/bindings/details_secteurs_binding.dart';
import 'package:mdmscoops/screens/detail_secteur/views/details_secteurs_view.dart';
import 'package:mdmscoops/screens/entreprise/bindings/entreprise_binding.dart';
import 'package:mdmscoops/screens/entreprise/views/entreprise_view.dart';
import 'package:mdmscoops/screens/home/bindings/home_binding.dart';
import 'package:mdmscoops/screens/home/views/home_views.dart';
import 'package:mdmscoops/screens/inscription/bindings/inscription_binding.dart';
import 'package:mdmscoops/screens/inscription/views/inscription_view.dart';
import 'package:mdmscoops/screens/onboarding/bindings/onboarding_bindings.dart';
import 'package:mdmscoops/screens/onboarding/views/onboarding.dart';
import 'package:mdmscoops/screens/products/bindings/product_bindings.dart';
import 'package:mdmscoops/screens/products/views/product_views.dart';
import 'package:mdmscoops/screens/produits/bindings/produits_bindings.dart';
import 'package:mdmscoops/screens/produits/views/produit_view.dart';
import 'package:mdmscoops/screens/profil_entrepreneur/bindings/profil_entrepreneur_binding.dart';
import 'package:mdmscoops/screens/profil_entrepreneur/views/profil_entrepreneur_view.dart';
import 'package:mdmscoops/screens/secteurs/bindings/secteurs_binding.dart';
import 'package:mdmscoops/screens/secteurs/views/secteurs_view.dart';
import 'package:mdmscoops/screens/start/bindings/start_binding.dart';
import 'package:mdmscoops/screens/start/views/start_view.dart';

class AppPages {
  // Nous définisons ici les pages qui seront appelée en fonction des routes demandées
  static final pages = [
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.START,
      page: () => const StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: AppRoutes.HOMEPAGE,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUCTS,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.ENTREPRISES,
      page: () => const EntreprisesView(),
      binding: EntreprisesBinding(),
    ),
    GetPage(
      name: AppRoutes.SECTEURS,
      page: () => const SecteursView(),
      binding: SecteursBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAILSSECTEURS,
      page: () => const SecteurDetailView(),
      binding: SecteurDetailssBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUITSDETAILS,
      page: () => const DetailProduitView(),
      binding: ProduitDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUITS,
      page: () => const ProduitsView(),
      binding: ProduitBinding(),
    ),
    GetPage(
      name: AppRoutes.ENTREPRISEDETAILS,
      page: () => const EntrepriseDetailView(),
      binding: EntrepriseDetailBindiing(),
    ),
    GetPage(
      name: AppRoutes.COMPTEENTREPRISE,
      page: () => const CompteView(),
      binding: CompteBinding(),
    ),
    GetPage(
      name: AppRoutes.INSCRIPTION,
      page: () => const InscriptionView(),
      binding: InscriptionBinding(),
    ),
    GetPage(
      name: AppRoutes.CONNEXION,
      page: () => const ConnexionView(),
      binding: ConnexionBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILENTREPRENEUR,
      page: () => const ProfilEntrepreneurView(),
      binding: ProfilEntrepreneurBinding(),
    ),
  ];
}
