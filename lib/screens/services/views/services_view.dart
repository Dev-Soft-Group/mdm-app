import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/services/components/service_card.dart';
import 'package:mdmscoops/screens/services/controllers/services_controller.dart';

class ServicesView extends GetView<ServiceController> {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ServiceController>(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              foregroundColor: kWhiteColor,
              backgroundColor: kPrimaryColor,
              leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back,
                      size: 26, color: Colors.white)),
              title: const Text("Services"),
              actions: [
                Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/images/logo-mdm-scoops.jpg",
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
                        : GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.0,
                            shrinkWrap: true,
                            children: [
                              ...List.generate(
                                  controller.servicesList.length,
                                  (index) => ServiceCard(
                                      service: controller.servicesList[index])),
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
