import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mdmscoops/components/custom_dropdown.dart';
import 'package:mdmscoops/components/custom_input_field.dart';
import 'package:mdmscoops/components/custom_action_button.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/produits/controllers/produit_form_controller.dart';

class ProduitFormView extends GetView<ProduitFormController> {
  const ProduitFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProduitFormController>(builder: (controller) {
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
                                  Container(
                                      height: 30,
                                      width: 30,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration( shape: BoxShape.circle),
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
                                  Text(controller.produit != null ? "Modifier le produit" :
                                    "Ajouter un produit",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  const SizedBox(height: kDefaultPadding * 2),
                                  FormFieldInput(
                                    textController:
                                        controller.textEditingNomProduit,
                                    hintText: "Nom du produit",
                                    radius: kDefaultRadius,
                                  ),
                                  const SizedBox(height: kDefaultPadding),
                                  FormFieldInput(
                                    textController:
                                        controller.textEditingPrixProduit,
                                    keyboardType: TextInputType.number,
                                    hintText: "Prix du produit",
                                    radius: kDefaultRadius,
                                  ),
                                  const SizedBox(height: kDefaultPadding / 1.3),
                                  CustomDropDown(
                                    controller: controller,
                                    liste: controller.categories,
                                    selectedItem: controller.selectedCategory,
                                    onChanged: (data) {
                                      controller.onChangeCategory(data);
                                    },
                                    helpText: "Catégorie du produit",
                                  ),
                                  const SizedBox(height: kDefaultPadding),
                                  FormFieldInput(
                                    textController: controller
                                        .textEditingDescriptionProduit,
                                    hintText: "Description du produit",
                                    contentPadding: const EdgeInsets.only(
                                        top: 6, right: 0, left: 0),
                                    keyboardType: TextInputType.emailAddress,
                                    radius: kDefaultRadius,
                                    maxLines: 4,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Ajouter une image du produit",
                                    style: TextStyle(
                                      color: kBlackColor.withOpacity(0.8),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: kDefaultPadding /2),
                                  InkWell(
                                    onTap: () async {
                                      // if (controller.produit != null ){return;}
                                      await controller
                                          .choseImage(ImageSource.gallery);
                                    },
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration:
                                      controller.produit != null && controller.imageFile == null
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
                                                      controller.produit!.imageUrl!),
                                                  fit: BoxFit.cover),
                                            )
                                          : 
                                          BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                width: 1,
                                                color: kBlackColor
                                                    .withOpacity(0.3),
                                              ),
                                              image: controller.imageFile !=
                                                      null
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
                                  const SizedBox(height: kDefaultPadding * 2.5),
                                  controller.produitFormStatus ==
                                          AppStatus.appLoading
                                      ? Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(
                                                  color: kPrimaryColor),
                                        )
                                      : CustomActionButton(
                                          title: controller.produit != null ? "Mettre à jour" : "Enregistrer",
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
