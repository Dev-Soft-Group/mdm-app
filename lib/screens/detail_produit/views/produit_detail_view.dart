import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/detail_produit/controllers/produit_detail_controller.dart';
import 'package:mdmscoops/screens/entreprise/views/entreprise_view.dart';

class DetailProduitView extends GetView<ProduitDetailController> {
  const DetailProduitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProduitDetailController>(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getProductById();
            await controller.getAllCommentForProduit();
          },
          child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: kPrimaryColor,
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back,
                      size: 26, color: kWhiteColor),
                ),
                title: const Text("Détail du produit",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))),
            body: controller.productStatus == AppStatus.appLoading
                ? Container(
                    height: Get.height,
                    width: Get.width,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: kPrimaryColor.withOpacity(0.4),
                    ))
                : Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: const BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: AspectRatio(
                                  aspectRatio: 4 / 3,
                                  child: CachedNetworkImage(
                                    imageUrl: controller.produit!.imageUrl!
                                        .toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            colorFilter: const ColorFilter.mode(
                                                Colors.transparent,
                                                BlendMode.colorBurn)),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error, size: 36),
                                  ),
                                ),
                              ),
                              controller.produit!.prix != null
                                  ? Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 35,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: kDefaultPadding),
                                        decoration: const BoxDecoration(
                                          color: kBlackColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  kDefaultRadius * 1.5)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${controller.produit!.prix!} F",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: kWhiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.produit!.nom!
                                      .toString()
                                      .capitalizeFirst!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding - 4),
                                Text(
                                  controller.produit!.description!.toString(),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kBlackColor.withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding * 1.5),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Par: ",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: kBlackColor
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                                Text(
                                                  controller.produit!
                                                      .entreprises!.first.nom!
                                                      .toString()
                                                      .capitalizeFirst!,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: kBlackColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Le ${DateTime.parse(controller.produit!.created_at!.toString()).day.toString().padLeft(2, "0")}-${DateTime.parse(controller.produit!.created_at!.toString()).month.toString().padLeft(2, "0")}-${DateTime.parse(controller.produit!.created_at!.toString()).year.toString().padLeft(2, "0")}",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 14,
                                                color: kBlackColor
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                          ]),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              onTap: () async { await controller.likerProduit();},
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(controller.produit!.likes!.toString(),
                                                    style: const TextStyle(fontSize: 15)
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Icon(
                                                      CupertinoIcons.hand_thumbsup,
                                                      size: 26,
                                                      color: kPrimaryColor
                                                          .withOpacity(0.8)),
                                                ],
                                              )),
                                          const SizedBox(width: 18),
                                          InkWell(
                                              onTap: () { Get.toNamed(AppRoutes.COMMENTAIRE_PRODUIT, arguments: { "idProduit": controller.produit!.id! }); },
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                   Text(controller.produit!.commentaires!.toString(),
                                                    style: const TextStyle(fontSize: 15)
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Icon(
                                                      Icons.comment_outlined,
                                                      size: 26,
                                                      color: kPrimaryColor
                                                          .withOpacity(0.8)),
                                                ],
                                              )),
                                          const SizedBox(width: 18),
                                          InkWell(
                                            onTap: () async {
                                                controller
                                                    .sendWhatsAppMessenger();
                                              },
                                            child: Image.asset(
                                                "assets/icons/Iconlogo-whatsapp.png",
                                                height: 22,
                                                width: 22,
                                                color: kPrimaryColor
                                                    .withOpacity(0.9)),
                                          ),
                                          const SizedBox(width: 8),
                                        ],
                                      ),
                                    ]),
                                
                                controller.entreprisesList.isNotEmpty ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: kDefaultPadding * 1.5),
                                    const TextTitle(text: "Entreprises ayant le produit"),
                                    const SizedBox(height: kDefaultPadding / 2 ),                                
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children:  List.generate(
                                                    controller.entreprisesList.length,
                                                    (index) => Container(
                                                      height: 130,
                                                      width: 140,
                                                      margin: const EdgeInsets.only(right: 6),
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: const BoxDecoration(),
                                                      child: CustomCard(
                                                          item: controller
                                                              .entreprisesList[index]),
                                                    )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ) : Container(),
                                                           
                                const SizedBox(height: kDefaultPadding *1.5 ),
                                controller.commentaires.isNotEmpty ? const TextTitle(text: "Avis récents") : Container(),
                                const SizedBox(height: kDefaultPadding ),
                                ...List.generate( controller.commentaires.length > 5 ? 5 : controller.commentaires.length, (index) => 
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(controller.commentaires[index].username!.capitalizeFirst!,
                                          style: TextStyle(
                                            color: kBlackColor.withOpacity(0.8),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(controller.commentaires[index].contenu!.capitalizeFirst!,
                                          style: TextStyle(
                                            color: kBlackColor.withOpacity(0.48),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.grey[200],
                                          radius: 30,
                                          child: Icon(CupertinoIcons.person, size: 36, color: kBlackColor.withOpacity(0.2),),
                                        ),
                                        trailing: Text("Le ${DateTime.parse(controller.commentaires[index].createdAt!.toString()).day.toString().padLeft(2, "0")}-${DateTime.parse(controller.commentaires[index].createdAt!.toString()).month.toString().padLeft(2, "0")}-${DateTime.parse(controller.commentaires[index].createdAt!.toString()).year.toString().padLeft(2, "0")}",
                                          style: TextStyle(
                                            color: kBlackColor.withOpacity(0.6),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.only(left: 0),
                                      ),
                                      const Divider(thickness: 1.2,)
                                    ],
                                  ),
                                ), ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
