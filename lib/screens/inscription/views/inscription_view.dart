import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/custom_input_field.dart';
import 'package:mdmscoops/components/custom_action_button.dart';
import 'package:mdmscoops/components/custom_outline_action_button.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/inscription/controllers/inscription_controller.dart';

class InscriptionView extends GetView<InscriptionController> {
  const InscriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<InscriptionController>(builder: (controller) {
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
                                      onTap: () {},
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
                                        "Inscription",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  FormFieldInput(
                                    onChanged: (string) {},
                                    hintText: "Entrez votre nom",
                                    radius: kDefaultRadius *3 ,
                                  ),
                                  const SizedBox(height: 20),
                                  FormFieldInput(
                                    onChanged: (string) {},
                                    hintText: "Entrez votre email",
                                    keyboardType: TextInputType.emailAddress,
                                    radius: kDefaultRadius *3 ,
                                  ),
                                   const SizedBox(height: 20),
                                  FormFieldInput(
                                    onChanged: (string) {},
                                    hintText: "Entrez votre mot de passe",
                                    radius: kDefaultRadius *3 ,
                                  ),
                                  const SizedBox(height: 50),
                                  CustomActionButton(
                                    title: "Enregistrer",
                                    onTap: () {},
                                  ),
                                  const SizedBox(height: 20),
                                   CustomOutlineActionButton(
                                    title: "Se connecter",
                                    onTap: () {},
                                  ),
                                  const SizedBox(height: 40),
                                ]),
                          ),
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                              color: kWhiteColor,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/Composant 4 – 3.png"),
                              ),
                            ),
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
