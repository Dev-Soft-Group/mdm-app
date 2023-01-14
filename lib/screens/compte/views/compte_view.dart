import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mdmscoops/components/app_country_code.dart';
import 'package:mdmscoops/components/custom_dropdown.dart';
import 'package:mdmscoops/components/custom_input_field.dart';
import 'package:mdmscoops/components/custom_action_button.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/compte/controllers/compte_controller.dart';

class CompteView extends GetView<CompteController> {
  const CompteView({Key? key}) : super(key: key);

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
                                    children: [
                                      Text(
                                        controller.entreprise != null
                                            ? "Mettre à jour le compte"
                                            : "Compte entrepreneur",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: kBlackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  controller.entreprise == null
                                      ? CustomDropDown(
                                          controller: controller,
                                          liste: controller.corpsM,
                                          selectedItem:
                                              controller.selectedCorps,
                                          onChanged: (data) {
                                            controller.onChangeCorpsM(data);
                                          },
                                          helpText: "Corps métier",
                                        )
                                      : Container(height: 10),
                                  const SizedBox(height: 16),
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
                                              "E-mail",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: kBlackColor
                                                      .withOpacity(0.4),
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
                                        "Siège social",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kBlackColor.withOpacity(0.4),
                                            fontSize: 14),
                                      ),
                                      const SizedBox(height: 5),
                                      FormFieldInput(
                                        textController:
                                            controller.textEditingSiegeSocial,
                                        onChanged: (string) {},
                                        hintText: "Ex: Yaoundé",
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  controller.entreprise != null && controller.entreprise!.telephone!
                                          .startsWith("+")
                                      ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Téléphone",
                                              style: TextStyle(
                                                  color: kBlackColor
                                                      .withOpacity(0.4),
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 5),
                                            FormFieldInput(
                                              keyboardType:
                                                  TextInputType.phone,
                                              textController:
                                                  controller.textEditingTelephone,
                                              onChanged: (string) {},
                                              hintText: "Ex: +237670000000",
                                            ),
                                          ],
                                        )
                                      : SelectCountryCode(
                                          textController:
                                              controller.textEditingTelephone,
                                          controller: controller,
                                          onChanged: (value) {}),
                                  const SizedBox(height: 16),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                          controller.webSites.length,
                                          (i) => Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                margin: const EdgeInsets.only(
                                                    right: 8),
                                                decoration: BoxDecoration(
                                                  color: kBlackColor
                                                      .withOpacity(0.04),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          kDefaultRadius * 3),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      controller.webSites[i]
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: kBlackColor
                                                            .withOpacity(0.7),
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    InkWell(
                                                        onTap: () {
                                                          controller
                                                              .removeWebSiteByIndex(
                                                                  i);
                                                        },
                                                        child: Container(
                                                            height: 20,
                                                            width: 20,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          kDefaultRadius *
                                                                              10),
                                                              color: kBlackColor
                                                                  .withOpacity(
                                                                      0.1),
                                                            ),
                                                            child: Icon(
                                                                Icons.close,
                                                                size: 16,
                                                                color: kBlackColor
                                                                    .withOpacity(
                                                                        0.6)))),
                                                  ],
                                                ),
                                              )),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Site web",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kBlackColor.withOpacity(0.4),
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  FormFieldInput(
                                    textController:
                                        controller.textEditingSiteWeb,
                                    hintText: "Ex: http://www.info.com",
                                    keyboardType: TextInputType.url,
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          controller.addWebSite();
                                        },
                                        child: Icon(CupertinoIcons.add_circled,
                                            size: 26,
                                            color: kPrimaryColor
                                                .withOpacity(0.8))),
                                  ),
                                  const SizedBox(height: 16),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                          controller.pagesSociales.length,
                                          (i) => Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                margin: const EdgeInsets.only(
                                                    right: 8),
                                                decoration: BoxDecoration(
                                                  color: kBlackColor
                                                      .withOpacity(0.04),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          kDefaultRadius * 3),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      controller
                                                          .pagesSociales[i]
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: kBlackColor
                                                            .withOpacity(0.7),
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    InkWell(
                                                        onTap: () {
                                                          controller
                                                              .removePageSocialeByIndex(
                                                                  i);
                                                        },
                                                        child: Container(
                                                            height: 20,
                                                            width: 20,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          kDefaultRadius *
                                                                              10),
                                                              color: kBlackColor
                                                                  .withOpacity(
                                                                      0.1),
                                                            ),
                                                            child: Icon(
                                                                Icons.close,
                                                                size: 16,
                                                                color: kBlackColor
                                                                    .withOpacity(
                                                                        0.6)))),
                                                  ],
                                                ),
                                              )),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Pages sociales",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kBlackColor.withOpacity(0.4),
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  FormFieldInput(
                                    textController:
                                        controller.textEditingPageSociale,
                                    hintText: "Ex: http://www.facebook.com",
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          controller.addPageSociale();
                                        },
                                        child: Icon(CupertinoIcons.add_circled,
                                            size: 26,
                                            color: kPrimaryColor
                                                .withOpacity(0.8))),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Description de l'entreprise",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: kBlackColor.withOpacity(0.4),
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  FormFieldInput(
                                      textController:
                                          controller.textEditingDescription,
                                      onChanged: (string) {},
                                      hintText:
                                          "Entrez la description de votre entreprise ici ...",
                                      maxLines: 3),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Logo de l'entreprise",
                                    style: TextStyle(
                                      color: kBlackColor.withOpacity(0.8),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: kDefaultPadding / 2),
                                  InkWell(
                                    onTap: () async {
                                      await controller
                                          .choseImage(ImageSource.gallery);
                                    },
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration:
                                          controller.entreprise != null && controller.imageFile == null
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                width: 1,
                                                color: kBlackColor
                                                    .withOpacity(0.3),
                                              ),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      controller.entreprise!.logoUrl!.toString(),),
                                                  fit: BoxFit.fill),
                                            )
                                          : 
                                          BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 1,
                                          color: kBlackColor.withOpacity(0.3),
                                        ),
                                        image: controller.imageFile != null
                                            ? DecorationImage(
                                                image: FileImage(
                                                    controller.imageFile),
                                                fit: BoxFit.cover)
                                            : null,
                                      ),
                                      child: Center(
                                        child: Icon(CupertinoIcons.camera,
                                            color: kBlackColor.withOpacity(0.4),
                                            size: 30),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  controller.entrepriseStatus ==
                                          AppStatus.appLoading
                                      ? Container(
                                          height: 50,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(
                                                  color: kPrimaryColor),
                                        )
                                      : CustomActionButton(
                                          title: controller.entreprise != null
                                              ? "Mettre à jour"
                                              : "Enregistrer",
                                          onTap: () async {
                                            await controller.saveEntreprise();
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
