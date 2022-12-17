import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_country_code.dart';
import 'package:mdmscoops/components/custom_dropdown.dart';
import 'package:mdmscoops/components/custom_input_field.dart';
import 'package:mdmscoops/components/custom_action_button.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/compte/controllers/compte_controller.dart';

class SuccursaleFormView extends GetView<CompteController> {
  const SuccursaleFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CompteController>(builder: (controller) {
        return Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              color: kWhiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            alignment: Alignment.topLeft,
                            decoration: const BoxDecoration(
                              color: kWhiteColor,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/Composant 4 – 2.png"),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Image.asset(
                                    "assets/images/D-SoftTechWhite.png",
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.fill,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Ajouter une succursale",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: kDefaultPadding * 2),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Nom",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: kBlackColor
                                                      .withOpacity(0.4),
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 5),
                                            FormFieldInput(
                                              textController:
                                                  controller.textEditingNom,
                                              onChanged: (string) {},
                                              hintText: "Ex: DouxSoftTech",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Localisation",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: kBlackColor
                                                      .withOpacity(0.4),
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 5),
                                            FormFieldInput(
                                              textController: controller
                                                  .textEditingLocalisation,
                                              onChanged: (string) {},
                                              hintText: "Ex: Yaoundé",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                  const SizedBox(height: 16),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "E-mail",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kBlackColor.withOpacity(0.4),
                                            fontSize: 14),
                                      ),
                                      const SizedBox(height: 5),
                                      FormFieldInput(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textController:
                                            controller.textEditingEmail,
                                        onChanged: (string) {},
                                        hintText: "Ex: info@gmail.com",
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  SelectCountryCode(
                                      controller: controller,
                                      onChanged: (value) {
                                        controller.textEditingTelephone.text =
                                            value;
                                        controller.update();
                                      }),
                                  const SizedBox(height: kDefaultPadding * 4),
                                  controller.succursaleStatus ==
                                          AppStatus.appLoading
                                      ? Container(
                                          height: 50,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(
                                                  color: kPrimaryColor),
                                        )
                                      : CustomActionButton(
                                          title: "Enregistrer",
                                          onTap: () async {
                                            await controller.saveSuccursale();
                                          },
                                        ),
                                  const SizedBox(height: 40),
                                ]),
                          ),
                        ]),
                  ),
                ),
              ]),
            ),
          ),
        );
      }),
    );
  }
}
