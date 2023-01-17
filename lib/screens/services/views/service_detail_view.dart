
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/entreprise/views/entreprise_view.dart';
import 'package:mdmscoops/screens/services/controllers/detail_services_controller.dart';

class ServicesDetailView extends GetView<ServiceDetailController> {
  const ServicesDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ServiceDetailController>(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              leading: InkWell(
                onTap: (){Get.back();},
                child: const Icon(Icons.arrow_back, size: 26, color: Colors.white)
              ),
              title: Text( controller.service != null ? controller.service!.nom!.capitalizeFirst! : "Detail Services",
                style: const TextStyle( fontSize: 16),
              ),
              actions: [
                Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration( shape: BoxShape.circle),
                    child: Image.asset("assets/images/logo-mdm-scoops.jpg",
                        fit: BoxFit.fill)),
                const SizedBox(
                  width: kDefaultPadding,
                )
              ],  
            ),
            body: SingleChildScrollView(
              child: Container(
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
                    Text(controller.service!.description!.capitalizeFirst!,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.3,
                        fontWeight: FontWeight.w400,
                    )),
                     const SizedBox(
                      height: kDefaultPadding * 1.3,
                    ),
                    const Text("Entreprises",
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                    )),
                     const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Container(
                      height: Get.height - 178,
                      margin: const EdgeInsets.only(bottom: kDefaultPadding),
                      decoration: const BoxDecoration(),
                      child: controller.entrepriseListStatus == AppStatus.appLoading
                        ? Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                              color: kPrimaryColor
                                  .withOpacity(0.4)),
                        )
                        : controller.entreprisesList.isNotEmpty ? GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          shrinkWrap: true,
                          children: List.generate(
                              controller.entreprisesList.length,
                              (index) => CustomCard(
                                  item: controller.entreprisesList[index])),
                        ) : Container(
                          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding*1.5),
                          alignment: Alignment.center,
                          child: Text("Aucune entreprise n'offre le service ${controller.service!.nom!.toUpperCase()} !!!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kBlackColor.withOpacity(0.6),
                              fontSize: 16,
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ));
      }),
    );
  }
}

