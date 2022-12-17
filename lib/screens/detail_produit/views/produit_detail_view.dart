import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/detail_produit/controllers/produit_detail_controller.dart';

class DetailProduitView extends GetView<ProduitDetailController> {
  const DetailProduitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProduitDetailController>(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getProductById();
          },
          child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: kWhiteColor,
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back,
                      size: 26, color: kBlackColor),
                ),
                title: const Text("Détail",
                    style: TextStyle(
                      color: kBlackColor,
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
                                    child: controller.produit == null ? Image.asset(
                                        "assets/images/photo.jpg",
                                        fit: BoxFit.fill) : Image.network(controller.produit!.imageUrl!, fit: BoxFit.fill)),
                              ),
                              /*Positioned(
                                top: 20,
                                right: 20,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 6),
                                            blurRadius: 8,
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ]),
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
                              ),*/
                              Positioned(
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
                                    child: Text("${controller.produit!.prix!} F",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
                                Text(controller.produit!.nom!.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding - 4),
                                Text(controller.produit!.description!.toString(),
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
                                                const Text(
                                                  "DouxSoftTech",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: kBlackColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Le 26/09/2022",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
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
                                              onTap: () {},
                                              child: Icon(CupertinoIcons.heart,
                                                  size: 26,
                                                  color: kPrimaryColor
                                                      .withOpacity(0.8))),
                                          const SizedBox(width: 8),
                                          InkWell(
                                              onTap: () async {controller.sendWhatsAppMessenger(); },
                                              child: Icon(
                                                  Icons.comment_outlined,
                                                  size: 26,
                                                  color: kPrimaryColor
                                                      .withOpacity(0.8))),
                                          const SizedBox(width: 8),
                                          InkWell(
                                              onTap: () {
                                              },
                                              child: Icon(Icons.share,
                                                  size: 26,
                                                  color: kPrimaryColor
                                                      .withOpacity(0.8))),
                                          const SizedBox(width: 8),
                                          InkWell(
                                              onTap: () {
                                                
                                              },
                                              child: Icon(
                                                  Icons.more_vert_outlined,
                                                  size: 26,
                                                  color: kPrimaryColor
                                                      .withOpacity(0.8))),
                                        ],
                                      ),
                                    ]),
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
