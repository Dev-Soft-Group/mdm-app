import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/entreprise/controllers/my_enterprise_controller.dart';

class MyEnterprisesView extends GetView<MyEnterpriseController> {
  const MyEnterprisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MyEnterpriseController>(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
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
                    height: kDefaultPadding,
                  ),
                  Text(
                      "Veuillez sélectionner l'entreprise avec laquelle vous souhaitez mené vos activités aujourd'hui.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kBlackColor.withOpacity(0.5))),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    height: Get.height - 178,
                    margin: const EdgeInsets.only(bottom: kDefaultPadding),
                    decoration: const BoxDecoration(),
                    child: controller.entrepriseStatus == AppStatus.appLoading
                        ? Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                                color: kPrimaryColor.withOpacity(0.4)),
                          )
                        : GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.0,
                            shrinkWrap: true,
                            children: [
                              ...List.generate(
                                  controller.entreprisesList.length,
                                  (index) => InkWell(
                                        onTap: () async {
                                          controller.saveEntreprise(controller.entreprisesList[index].id!.toString());
                                        },
                                        child: Card(
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 70,
                                                        width: 70,
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
                                                        child: Image.network(
                                                            controller
                                                                .entreprisesList[
                                                                    index]
                                                                .logoUrl!
                                                                .toString())),
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
                                                                  .entreprisesList[
                                                                      index]
                                                                  .nom!
                                                                  .toString()
                                                                  .capitalizeFirst!,
                                                              style: TextStyle(
                                                                color: kBlackColor
                                                                    .withOpacity(
                                                                        0.8),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 16,
                                                              )),
                                                          Text(
                                                              "Tel: ${controller.entreprisesList[index].telephone!.toString().capitalizeFirst!}",
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: TextStyle(
                                                                color: kBlackColor
                                                                    .withOpacity(
                                                                        0.6),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      )),
                              InkWell(
                                onTap: () {
                                  Get.offAndToNamed(AppRoutes.COMPTEENTREPRISE);
                                },
                                child: Card(
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 70,
                                              width: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                color: kBlackColor
                                                    .withOpacity(0.08),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                  CupertinoIcons.add,
                                                  size: 36)),
                                        ),
                                        const SizedBox(
                                            height: kDefaultPadding * 1.5),
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(),
                                            child: Text(
                                                "Ajouter une entreprise",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: kBlackColor
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
