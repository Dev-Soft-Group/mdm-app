import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/succursale_card.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/detail_entreprise/controllers/detail_entreprise_controller.dart';
import 'package:mdmscoops/screens/services/components/service_card.dart';
import 'package:url_launcher/url_launcher.dart';

class EntrepriseDetailView extends GetView<EntrepriseDetailController> {
  const EntrepriseDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntrepriseDetailController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              body: controller.entrepriseStatus == AppStatus.appLoading
                  ? Container(
                      height: Get.height,
                      width: Get.width,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: kPrimaryColor.withOpacity(0.4),
                      ))
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: const Icon(
                                                    Icons.arrow_back,
                                                    size: 26,
                                                    color: kWhiteColor)),
                                            const Spacer(),
                                            Container(
                                                height: 30,
                                                width: 30,
                                                clipBehavior: Clip.antiAlias,
                                                decoration:
                                                    const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                child: Image.asset(
                                                    "assets/images/logo-mdm-scoops.jpg",
                                                    fit: BoxFit.fill)),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                          ]),
                                    ),
                                    const SizedBox(height: kDefaultPadding),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding - 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Tel: ${controller.entreprise!.telephone!.toString().capitalizeFirst!}",
                                                style: const TextStyle(
                                                  color: kWhiteColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                "Email: ${controller.entreprise!.email!}",
                                                style: const TextStyle(
                                                  color: kWhiteColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          controller.entreprise != null
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  height: 75,
                                                  width: 75,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: controller
                                                        .entreprise!.logoUrl!
                                                        .toString(),
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.cover,
                                                            colorFilter:
                                                                const ColorFilter
                                                                        .mode(
                                                                    Colors
                                                                        .transparent,
                                                                    BlendMode
                                                                        .colorBurn)),
                                                      ),
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error,
                                                            size: 36),
                                                  ),
                                                )
                                              : Container(
                                                  height: 75,
                                                  width: 75,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kWhiteColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset:
                                                            const Offset(2, 1),
                                                        blurRadius: 5,
                                                        color: kBlackColor
                                                            .withOpacity(0.3),
                                                      )
                                                    ],
                                                  ),
                                                  child: Icon(Icons.person,
                                                      size: 60,
                                                      color: kBlackColor
                                                          .withOpacity(0.5))),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding - 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Siège social: ${controller.entreprise!.siegeSocial.toString().capitalizeFirst!}",
                                            style: const TextStyle(
                                              color: kWhiteColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                controller.entreprise!.nom
                                                    .toString()
                                                    .capitalizeFirst!,
                                                style: const TextStyle(
                                                  color: kWhiteColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              /*const Text(
                                            "Informatique",
                                            style: TextStyle(
                                              color: kWhiteColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),*/
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: kDefaultPadding / 2),
                                  ],
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding - 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TextTitle(text: "Description"),
                                    const SizedBox(height: kDefaultPadding / 2),
                                    Text(
                                      controller.entreprise!.description!
                                              .isNotEmpty
                                          ? controller.entreprise!.description!.toString().capitalizeFirst!
                                          : "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: kBlackColor.withOpacity(0.6),
                                        fontSize: 15,
                                        height: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: kDefaultPadding - 4),
                                    controller
                                            .entreprise!.succursales!.isNotEmpty
                                        ? Text(
                                            "Succursale(s)",
                                            style: TextStyle(
                                              color:
                                                  kBlackColor.withOpacity(0.8),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        : Container(),
                                const SizedBox(height: kDefaultPadding - 4),
                                const TextTitle(text: "Mes services"),
                                const SizedBox(height: kDefaultPadding/2),
                                controller.servicesStatus == AppStatus.appLoading ?
                                Container(
                                  height: 270,
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator( color: kPrimaryColor.withOpacity(0.4))
                                ):
                                controller.servicesList.isNotEmpty ? Container(
                                    decoration: const BoxDecoration(),
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(children:
                                          List.generate(controller.servicesList.length, 
                                          (index)=>Padding(
                                                padding: const EdgeInsets.only(
                                                    right: kDefaultPadding - 5),
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      height: 220,
                                                      width: 200,
                                                      child: ServiceCard(
                                                        service: controller.servicesList[index],
                                                        logoHeight: 65,
                                                        maxLinesTitle: 2,  
                                                        maxLinesContent: 4,  
                                                      ),
                                                    )),
                                              ))
                                        )
                                            ):  Container(
                                  height: 270,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding*1.5),
                                  child: Text("Vous n'avez encore aucun service pour le moment",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: kBlackColor.withOpacity(0.6)
                                    ),
                                  )
                                ),
                                    const SizedBox(height: kDefaultPadding / 2),
                                    ...List.generate(
                                      controller
                                          .entreprise!.succursales!.length,
                                      (i) => SuccursaleCard(succursale: controller.entreprise!.succursales![i],)
                                    ),
                                    const SizedBox(height: kDefaultPadding - 4),
                                    controller.siteWeb.isNotEmpty
                                        ? Text(
                                            "Sites web",
                                            style: TextStyle(
                                              color:
                                                  kBlackColor.withOpacity(0.8),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        : Container(),
                                    const SizedBox(height: kDefaultPadding / 2),
                                    ...List.generate(
                                      controller.siteWeb.length,
                                      (i) => controller.siteWeb[i].isNotEmpty
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  String url = (controller
                                                              .siteWeb[i]
                                                              .startsWith(
                                                                  "http://") ||
                                                          controller.siteWeb[i]
                                                              .startsWith(
                                                                  "https://"))
                                                      ? controller.siteWeb[i]
                                                      : "http://${controller.siteWeb[i]}";

                                                  if (!await launchUrl(
                                                      Uri.parse(url),
                                                      mode: LaunchMode
                                                          .externalApplication)) {
                                                    throw 'Could not launch $url';
                                                  }
                                                },
                                                child: Row(children: [
                                                  Image.asset(
                                                      "assets/icons/Icon-sitemap.png",
                                                      height: 30,
                                                      width: 30),
                                                  const SizedBox(
                                                      height: kDefaultPadding),
                                                  Text(
                                                    controller.siteWeb[i],
                                                    style: TextStyle(
                                                      color: kBlackColor
                                                          .withOpacity(0.6),
                                                      fontSize: 15,
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                                ]),
                                              ),
                                            )
                                          : Container(),
                                    ),
                                    const SizedBox(
                                        height: kDefaultPadding * 1.5),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              "assets/icons/Icon-facebook.png",
                                              height: 40,
                                              width: 40),
                                          const SizedBox(
                                              width: kDefaultPadding),
                                          InkWell(
                                            onTap: () async {
                                              controller
                                                  .sendWhatsAppMessenger();
                                            },
                                            child: Image.asset(
                                                "assets/icons/Iconlogo-whatsapp.png",
                                                height: 40,
                                                width: 40),
                                          ),
                                          const SizedBox(
                                              width: kDefaultPadding),
                                          Image.asset(
                                              "assets/icons/Icon-twitter.png",
                                              height: 40,
                                              width: 40),
                                          const SizedBox(
                                              width: kDefaultPadding),
                                        ]),
                                    const SizedBox(height: kDefaultPadding * 2),
                                  ],
                                ),
                              ),
                            ]),
                      ))));
    });
  }
}
