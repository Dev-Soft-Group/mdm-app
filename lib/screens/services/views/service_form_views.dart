import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/services/controllers/services_form_controller.dart';

class ServiceFormView extends GetView<ServicesFormController> {
  const ServiceFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ServicesFormController>(builder: (controller) {
        return Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              color: kWhiteColor,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 80,
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/Composant 4 – 2.png"),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 26,
                            color: kWhiteColor,
                          )),
                      Container(
                        height: 30,
                        width: 30,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/logo-mdm-scoops.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: kDefaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Selectioner les services",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kBlackColor.withOpacity(0.5),
                                fontSize: 16),
                          ),
                          InkWell(
                            onTap: () async { await controller.save(); },
                            child: controller.saveStatus == AppStatus.appLoading ? 
                            Container(
                              height: 25,
                              width: 25,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(),
                              child: CircularProgressIndicator(color: kPrimaryColor.withOpacity(0.3)),
                            )
                            : Row(
                              children: const [
                                Icon(CupertinoIcons.check_mark,
                                    size: 16, color: kPrimaryColor),
                                  SizedBox(width: 5,),
                                Text(
                                  "Valider",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: Get.height - 150,
                        alignment: Alignment.topLeft,
                        child: controller.servicesStatus == AppStatus.appLoading ?
                        Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(color: kPrimaryColor.withOpacity(0.6)),
                        )
                        : SingleChildScrollView(
                          child: Column(children: [
                            const SizedBox(height: kDefaultPadding),
                            ...List.generate(
                                controller.servicesList.length,
                                (index) => Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.addToList(controller
                                                .servicesList[index].id!);
                                          },
                                          child: ListTile(
                                            title: Text(
                                              controller
                                                  .servicesList[index].nom!,
                                              style: TextStyle(
                                                color: kBlackColor
                                                    .withOpacity(0.8),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            subtitle: Text(
                                              "Crée le: ${DateTime.parse(controller.servicesList[index].created_at!.toString()).day.toString().padLeft(2, "0")}-${DateTime.parse(controller.servicesList[index].created_at!.toString()).month.toString().padLeft(2, "0")}-${DateTime.parse(controller.servicesList[index].created_at!.toString()).year.toString().padLeft(2, "0")}",
                                              style: TextStyle(
                                                color: kBlackColor
                                                    .withOpacity(0.6),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            leading: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey[200],
                                                radius: 22,
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                      controller
                                                          .servicesList[index]
                                                          .imageUrl!,
                                                      fit: BoxFit.fill),
                                                )),
                                            trailing: Icon(
                                              CupertinoIcons.check_mark,
                                              size: 20,
                                              color: controller.verifyValue(
                                                      controller
                                                          .servicesList[index]
                                                          .id!)
                                                  ? kPrimaryColor
                                                  : kBlackColor
                                                      .withOpacity(0.2),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(left: 0),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 1.1,
                                        )
                                      ],
                                    )),
                          ]),
                        ),
                      ),
                    ]),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
