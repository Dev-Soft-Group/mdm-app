import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/start/controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<StartController>(builder: (controller) {
        return Scaffold(
          body: Container(
              height: Get.height,
              width: Get.height,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: Get.height*0.23,
                    left: 0,
                    right: 0,
                    child: const Text(
                      "MDM SCOOPS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: Image.asset(
                        "assets/images/footerimg.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height / 1.6,
                    left: Get.width / 4,
                    right: Get.width / 4,
                    child: InkWell(
                      onTap: (){ Get.offAllNamed(AppRoutes.ONBOARDING);},
                      child: Container(
                        height: 45,
                        width: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius:
                                BorderRadius.circular(kDefaultRadius * 4),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(5, 4),
                                blurRadius: 10,
                                color: kBlackColor.withOpacity(0.3),
                              )
                            ]),
                        child: const Text(
                          "START",
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        );
      }),
    );
  }
}
