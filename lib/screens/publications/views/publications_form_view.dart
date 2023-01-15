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
import 'package:mdmscoops/screens/publications/controllers/publications_form_controller.dart';

class PublicationFormView extends GetView<PublicationFormController> {
  const PublicationFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<PublicationFormController>(builder: (controller) {
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
                                  Text(controller.publication != null ?
                                    "Modifier la publication" : "Créer une publication",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  const SizedBox(height: kDefaultPadding * 2),
                                  FormFieldInput(
                                    textController:
                                        controller.textEditingTitrePublication,
                                    hintText: "Titre",
                                    radius: kDefaultRadius,
                                  ),
                                
                                  const SizedBox(height: kDefaultPadding/1.3),
                                  CustomDropDown(
                                    controller: controller,
                                    liste: controller.typePublications,
                                    selectedItem: controller.selectedType,
                                    onChanged: (data) {
                                      controller.onChangeTypePublication(data);
                                    },
                                    helpText: "Type de publication",
                                  ),
                                  const SizedBox(height: kDefaultPadding),
                                  FormFieldInput(
                                    textController: controller
                                        .textEditingDescriptionPublication,
                                    hintText: "Description de la publication",
                                    contentPadding: const EdgeInsets.only(top:6, right:0, left:0),
                                    keyboardType: TextInputType.emailAddress,
                                    radius: kDefaultRadius,
                                    maxLines: 4,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(controller.publication != null ?
                                   "Modifier l'image" : "Ajouter une image",
                                    style: TextStyle(
                                      color: kBlackColor.withOpacity(0.8),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: kDefaultPadding /2),
                                  
                                  InkWell(
                                    onTap: () async {
                                      await controller
                                          .choseImage(ImageSource.gallery);
                                    },
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration:
                                          controller.publication != null && controller.imageFile == null
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
                                                      controller.publication!.imageUrl!.toString(),),
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
                                  const SizedBox(height: kDefaultPadding * 2.5),
                                  controller.publicationFormStatus ==
                                          AppStatus.appLoading
                                      ? Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(
                                                  color: kPrimaryColor),
                                        )
                                      : CustomActionButton(
                                          title: controller.publication != null ? "Mettre à jour" : "Enregistrer",
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
