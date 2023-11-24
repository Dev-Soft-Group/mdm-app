import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';

class AppNavigationDrawer extends StatelessWidget {
  const AppNavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      width: Get.width * 0.8,
      child: Container(
        height: Get.height,
        color: kWhiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/D-SoftTechWhite.png",
                            fit: BoxFit.fill)),
                    const SizedBox(height: kDefaultPadding - 4),
                    const Text(
                      "MDM SCOOPS",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                    const Spacer(),
                  ],
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: kDefaultPadding),
                      MenuItem(
                        image: "assets/icons/Icon-home.png",
                        title: "Accueil",
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.PRODUCTS);
                        },
                      ),
                      MenuItem(
                        image: "assets/icons/Icon-building.png",
                        title: "Entreprises",
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.ENTREPRISES);
                        },
                      ),
                      MenuItem(
                        image: "assets/icons/Icon-room-service.png",
                        title: "Publications",
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.PRODUITS);
                        },
                      ),
                      MenuItem(
                        image: "assets/icons/Icon-room-service.png",
                        title: "Secteurs d'activités",
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.SECTEURS);
                        },
                      ),
                      MenuItem(
                        image: "assets/icons/Icon-product-hunt.png",
                        title: "Produits",
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.HOMEPAGE);
                        },
                      ),
                      MenuItem(
                        image: "assets/icons/Icon-profile.png",
                        title: "Profil",
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.PROFILENTREPRENEUR);
                        },
                      ),
                      MenuItem(
                        image: "assets/icons/Icon-account-box.png",
                        title: "Créer un compte",
                        onTap: () {
                          Get.offAndToNamed(AppRoutes.COMPTEENTREPRISE);
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(),
                      ),
                      MenuItem(
                        image: "assets/icons/Icon-share.png",
                        title: "Partager",
                        onTap: () {},
                      ),
                      MenuItem(
                        image: "assets/icons/Icon-contacts.png",
                        title: "Aide et contact",
                        onTap: () {},
                      ),
                      MenuItem(
                        image:
                            "assets/icons/Icon-information-circle-outline.png",
                        title: "A propos",
                        onTap: () {},
                      ),
                      MenuItem(
                        image: "assets/icons/Icon-account-logout.png",
                        title: "Se déconnecter",
                        onTap: () async {
                          final LocalAuthService _localAuth =
                              LocalAuthServiceImpl();
                          await _localAuth.deleteToken();
                          Get.offAllNamed(AppRoutes.CONNEXION);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                height: 25,
                alignment: Alignment.center,
                child: Text(
                  "(c) All right reserved. by DouxSoftTech",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 11,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, this.title, this.image, this.onTap})
      : super(key: key);
  final String? title;
  final String? image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(children: [
        Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: Image.asset(image!, fit: BoxFit.cover)),
        const SizedBox(width: kDefaultPadding / 2),
        Text(
          title!,
          style: TextStyle(
            color: kBlackColor.withOpacity(0.8),
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        Container(),
      ]),
    );
  }
}
