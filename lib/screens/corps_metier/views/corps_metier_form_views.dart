
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/custom_dropdown.dart';
import 'package:mdmscoops/components/custom_input_field.dart';
import 'package:mdmscoops/components/custom_action_button.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/corps_metier/controllers/corps_metier_form_controller.dart';


class CorpsMetierFormView extends GetView<CorpsMetierFormController> {
  const CorpsMetierFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CorpsMetierFormController>(builder: (controller) {
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
                                  const Text(
                                    "Ajouter un corps métier",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  const SizedBox(height: kDefaultPadding * 3.5),
                                  FormFieldInput(
                                    textController:
                                        controller.textEditingNom,
                                    hintText: "Nom du corps métier",
                                    radius: kDefaultRadius,
                                  ),
                                  const SizedBox(height: kDefaultPadding/1.3),
                                  CustomDropDown(
                                          controller: controller,
                                          liste: controller.secteurs,
                                          selectedItem:
                                              controller.selectedSecteur,
                                          onChanged: (data) {
                                            controller.onChangeSecteur(data);
                                          },
                                          helpText: "Secteur d'activité",
                                        ),
                                  const SizedBox(height: kDefaultPadding * 6),
                                  controller.corpsMetierFormStatus ==
                                          AppStatus.appLoading
                                      ? Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(
                                                  color: kPrimaryColor),
                                        )
                                      : CustomActionButton(
                                          title: "Enregistrer",
                                          onTap: () async {
                                            await controller.save();
                                          },
                                        ),
                                  const SizedBox(height: kDefaultPadding * 2),
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
