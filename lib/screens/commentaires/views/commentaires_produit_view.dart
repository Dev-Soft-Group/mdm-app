import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/commentaires/controllers/commentaire_produit_controller.dart';

class CommentaireProduitView extends GetView<CommentaireProduitController> {
  const CommentaireProduitView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CommentaireProduitController>(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              leading: InkWell(
                onTap: (){Get.back();},
                child: const Icon(Icons.arrow_back, size: 26, color: Colors.white)
              ),
              title: const Text("Commentaires"),
              actions: [
                Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(),
                    child: Image.asset("assets/images/D-SoftTechWhite.png",
                        fit: BoxFit.fill)),
                const SizedBox(
                  width: kDefaultPadding,
                )
              ],  
            ),
            body: Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kDefaultPadding * 1.5,
                  ),
                  Container(
                    height: Get.height - 178,
                    margin: const EdgeInsets.only(bottom: kDefaultPadding),
                    decoration: const BoxDecoration(),
                    child: controller.servicesStatus == AppStatus.appLoading
                        ? Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                                color: kPrimaryColor.withOpacity(0.4)),
                          )
                        : Column(
                            children: [
                              ...List.generate(
                                  controller.servicesList.length,
                                  (index) => InkWell(
                                        onTap: (){ Get.toNamed(AppRoutes.SERVICES_DETAIL, arguments:  {"service": controller.servicesList[index]}); },
                                        onLongPress: () async {
                                          Get.toNamed(AppRoutes.CREATE_SERVICE, arguments:  {"service": controller.servicesList[index] });
                                        },
                                        child: Card(
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 50,
                                                      width: 50,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          BoxDecoration(
                                                        color: kBlackColor
                                                            .withOpacity(
                                                                0.08),
                                                        shape:
                                                            BoxShape.circle,
                                                      ),
                                                      child: 
                                                      CachedNetworkImage(
                                                        imageUrl: controller.servicesList[index].imageUrl!.toString(),
                                                        imageBuilder: (context, imageProvider) => Container(
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: imageProvider,
                                                                fit: BoxFit.cover,
                                                                colorFilter: const ColorFilter.mode(
                                                                    Colors.transparent, BlendMode.colorBurn)),
                                                          ),
                                                        ),
                                                        errorWidget: (context, url, error) =>
                                                            const Icon(Icons.error, size: 36),
                                                      ),
                                                     
                                                      ),
                                                  const SizedBox(
                                                      height: kDefaultPadding),
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              controller
                                                                  .servicesList[
                                                                      index]
                                                                  .nom!
                                                                  .toString()
                                                                  .capitalizeFirst!,
                                                                  maxLines:  1,
                                                                  overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                color: kBlackColor
                                                                    .withOpacity(
                                                                        0.8),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 16,
                                                              )),
                                                          Text(controller.servicesList[index].description.toString().capitalizeFirst!,
                                                              textAlign:
                                                                  TextAlign.justify,
                                                                maxLines: 2,
                                                                overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                color: kBlackColor
                                                                    .withOpacity(
                                                                        0.6),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      )),
                            ],
                          ),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
