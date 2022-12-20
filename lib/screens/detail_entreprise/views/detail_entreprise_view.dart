import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/detail_entreprise/controllers/detail_entreprise_controller.dart';
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
                                            // InkWell(
                                            //           onTap: (){ Get.toNamed(AppRoutes.COMPTEENTREPRISE, arguments: { "entreprise": controller.entreprise! }); },
                                            //           child: Container(
                                            //             height: 30,
                                            //             width: 30,
                                            //             alignment: Alignment.center,
                                            //             decoration: BoxDecoration(
                                            //               color: Colors.grey[300],
                                            //               shape: BoxShape.circle,
                                            //             ),
                                            //             child: const Icon(Icons.edit, size: 20, color: kPrimaryColor)
                                            //           ),
                                            //         ),

                                            Container(
                                                height: 30,
                                                width: 30,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: Image.asset(
                                                    "assets/images/D-SoftTechWhite.png",
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
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                        color: kBlackColor.withOpacity(0.8),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
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
                                    const SizedBox(height: kDefaultPadding / 2),
                                    ...List.generate(
                                      controller
                                          .entreprise!.succursales!.length,
                                      (i) => Card(
                                        color: kWhiteColor,
                                        shadowColor: kWhiteColor,
                                        elevation: 1,
                                        child: Container(
                                          height: 60,
                                          padding: const EdgeInsets.all(10.0),
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    controller.entreprise!
                                                        .succursales![i].nom!
                                                        .toString()
                                                        .capitalizeFirst!,
                                                    style: TextStyle(
                                                      color: kBlackColor
                                                          .withOpacity(0.8),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    controller
                                                        .entreprise!
                                                        .succursales![i]
                                                        .localisation!
                                                        .toString()
                                                        .capitalizeFirst!,
                                                    style: TextStyle(
                                                      color: kBlackColor
                                                          .withOpacity(0.7),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                              const Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    "Tel: ${controller.entreprise!.succursales![i].telephone!}",
                                                    style: TextStyle(
                                                      color: kBlackColor
                                                          .withOpacity(0.6),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    "Email: ${controller.entreprise!.succursales![i].email!}",
                                                    style: TextStyle(
                                                      color: kBlackColor
                                                          .withOpacity(0.6),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
