import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/custom_input_field.dart';
import 'package:mdmscoops/components/custom_action_button.dart';
import 'package:mdmscoops/components/custom_outline_action_button.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/routes/app_routes.dart';
import 'package:mdmscoops/screens/connexion/controllers/connexion_controller.dart';

class ConnexionView extends GetView<ConnexionController> {
  const ConnexionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ConnexionController>(builder: (controller) {
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
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Connexion",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 60),
                                  FormFieldInput(
                                    textController: controller.textEditingNom,
                                    hintText: "Entrez votre nom d'utilisateur",
                                    keyboardType: TextInputType.emailAddress,
                                    radius: kDefaultRadius * 3,
                                  ),
                                  const SizedBox(height: 30),
                                  FormFieldInput(
                                    textController:
                                        controller.textEditingPassword,
                                    hintText: "Entrez votre mot de passe",
                                    radius: kDefaultRadius * 3,
                                    obscureText: controller.obscureText,
                                    suffixIcon: InkWell(
                                        onTap: (){ controller.hideAndShow(); },
                                        child: Icon(
                                            controller.obscureText
                                                ? CupertinoIcons.eye
                                                : CupertinoIcons.eye_slash,
                                            size: 23)),
                                  ),
                                  const SizedBox(height: 90),
                                  controller.loginStatus == AppStatus.appLoading
                                      ? Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(
                                                  color: kPrimaryColor),
                                        )
                                      : Column(
                                          children: [
                                            CustomActionButton(
                                              title: "Se connecter",
                                              onTap: () async {
                                                await controller.login();
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                            CustomOutlineActionButton(
                                              title: "S'inscrire",
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes.INSCRIPTION);
                                              },
                                            ),
                                          ],
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
