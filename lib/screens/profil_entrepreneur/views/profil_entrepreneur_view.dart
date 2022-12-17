import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/card_pub_item.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/profil_entrepreneur/controllers/profil_entrepreneur_controller.dart';

class ProfilEntrepreneurView extends GetView<ProfilEntrepreneurController> {
  const ProfilEntrepreneurView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilEntrepreneurController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              body: controller.entrepriseStatus == AppStatus.appLoading ?
              Container(
                height: Get.height,
                width: Get.width,
                alignment: Alignment.center,
                child: CircularProgressIndicator(color: kPrimaryColor.withOpacity(0.4)),
              )
              : Container(
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                  ),
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // height: 180,
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: const Icon(
                                                Icons.arrow_back,
                                                size: 26,
                                                color: kWhiteColor)),
                                        const SizedBox(width: 15),
                                        const Text(
                                          "Profil",
                                          style: TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                          ),
                                           child: PopupMenuButton<dynamic>(
                                            icon: const Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white),
                                            onSelected: (value) {
                                              controller.switchList(value);
                                            },
                                            itemBuilder: (context) => const [
                                              PopupMenuItem(
                                                value: 1,
                                                child: Text("Ajouter un produit"),
                                              ),
                                              PopupMenuItem(
                                                value: 2,
                                                child: Text("Ajouter un service"),
                                              ),
                                              PopupMenuItem(
                                                value: 3,
                                                child: Text("Ajouter un SA"),
                                              ),
                                              PopupMenuItem(
                                                value: 4,
                                                child: Text("Ajouter un CM"),
                                              ),
                                               PopupMenuItem(
                                                value: 5,
                                                child: Text("Ajouter succursale"),
                                              ),
                                              PopupMenuItem(
                                                value: 6,
                                                child: Text("Ajouter une publication"),
                                              ),
                                            ],
                                        ),
                                         ),
                                      
                                      ]),
                                ),
                                const SizedBox(height: kDefaultPadding),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding - 4),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 60,
                                          width: 60,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kWhiteColor,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(2, 1),
                                                blurRadius: 5,
                                                color: kBlackColor
                                                    .withOpacity(0.3),
                                              )
                                            ],
                                          ),
                                          child: controller.entreprise != null ?
                                          Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.center,
                                            child: Image.network(controller.entreprise!.logoUrl!, fit: BoxFit.fill))
                                          : Icon(Icons.person,
                                              size: 50,
                                              color: kBlackColor
                                                  .withOpacity(0.5))),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.entreprise!.nom!.toString().capitalizeFirst!,
                                            style: const TextStyle(
                                              color: kWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "Tel: ${controller.entreprise!.telephone!}",
                                                style: const TextStyle(
                                                  color: kWhiteColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "Email: ${controller.entreprise!.email!}",
                                                style: const TextStyle(
                                                  color: kWhiteColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding * 1.5),
                              ],
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding - 4),
                            decoration: const BoxDecoration(),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.menus.length,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        controller.onTabChange(index);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: kDefaultPadding * 1.2,
                                            top: kDefaultPadding / 3,
                                            bottom: kDefaultPadding / 3),
                                        child: Text(
                                          controller.menus[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: controller.selectedTabs ==
                                                    index
                                                ? kBlackColor
                                                : kBlackColor.withOpacity(0.4),
                                            fontWeight:
                                                controller.selectedTabs == index
                                                    ? FontWeight.w600
                                                    : FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding - 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: kDefaultPadding),
                                Container(
                                  height: 80,
                                  decoration: const BoxDecoration(),
                                  child: GridView.count(
                                      crossAxisCount: 2,
                                      shrinkWrap: true,
                                      childAspectRatio: 7 / 3,
                                      mainAxisSpacing: kDefaultPadding - 5,
                                      crossAxisSpacing: kDefaultPadding - 5,
                                      physics: const NeverScrollableScrollPhysics(),
                                      children: [
                                        Card(
                                          color: kWhiteColor,
                                          shadowColor: kWhiteColor,
                                          elevation: 1,
                                          child: Container(
                                            height: 60,
                                            padding: const EdgeInsets.all(10.0),
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(controller.publicationsList.length.toString().padLeft(2, "0"),
                                                  style: const TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  "Publications",
                                                  style: TextStyle(
                                                    color: kBlackColor
                                                        .withOpacity(0.5),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: kWhiteColor,
                                          shadowColor: kWhiteColor,
                                          elevation: 1,
                                          child: Container(
                                            height: 60,
                                            padding: const EdgeInsets.all(10.0),
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(controller.produitsList.length.toString().padLeft(2, "0"),
                                                  style: const TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  "Total produits",
                                                  style: TextStyle(
                                                    color: kBlackColor
                                                        .withOpacity(0.5),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                const SizedBox(height: kDefaultPadding - 4),
                                const TextTitle(text: "Publications récentes"),
                                const SizedBox(height: kDefaultPadding/2),
                                controller.publicationStatus == AppStatus.appLoading ?
                                Container(
                                  height: 270,
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator( color: kPrimaryColor.withOpacity(0.4))
                                ):
                                controller.publicationsList.isNotEmpty ? Container(
                                    height: 228,
                                    decoration: const BoxDecoration(),
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(children:
                                          List.generate(controller.publicationsList.length, 
                                          (index)=>Padding(
                                                padding: const EdgeInsets.only(
                                                    right: kDefaultPadding - 5),
                                                child: CardPubItem(
                                                  onMessage: () async { await controller.sendWhatsAppMessenger(controller.publicationsList[index]);},
                                                  item: controller
                                                      .publicationsList[index],
                                                  width: Get.width / 1.85 - 25,
                                                  left: 0,
                                                  logoTop: 82,
                                                  bottom: 0,
                                                  bottomLeft:
                                                      kDefaultPadding - 4,
                                                  containerHeight: 212,
                                                  imageHeight: 100,
                                                )))
                                        )
                                            )):  Container(
                                  height: 270,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding*1.5),
                                  child: Text("Vous n'avez encore aucune publication pour le moment",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: kBlackColor.withOpacity(0.6)
                                    ),
                                  )
                                ),
                                const SizedBox(height: kDefaultPadding * 2),
                              ],
                            ),
                          ),
                        ]),
                  ))));
    });
  }
}
