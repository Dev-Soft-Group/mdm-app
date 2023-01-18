import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/custom_input_field.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/commentaires/controllers/commentaire_publication_controller.dart';

class CommentairePublicationView
    extends GetView<CommentairePublicationController> {
  const CommentairePublicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CommentairePublicationController>(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back,
                      size: 26, color: Colors.white)),
              title: const Text("Commentaires"),
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
            body: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: const BoxDecoration(),
                child: Container(
                  margin: const EdgeInsets.only(bottom: kDefaultPadding),
                  decoration: const BoxDecoration(),
                  child: controller.commentairesStatus == AppStatus.appLoading
                      ? Container(
                        height: Get.height,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                              color: kPrimaryColor.withOpacity(0.4)),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              "Ajouter un commentaire",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kBlackColor.withOpacity(0.4),
                                  fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            FormFieldInput(
                                textController:
                                    controller.textEditingCommentaire,
                                onChanged: (string) {},
                                hintText: "Entrez votre commentaire ici ...",
                                maxLines: 5),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () async { 
                                    if (controller.sendStatus == AppStatus.appLoading){ return;}
                                    await controller.saveCommentForPublication();},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: controller.sendStatus == AppStatus.appLoading ?
                                    Container(
                                      height: 28,
                                      width: 28,
                                      alignment: Alignment.center,
                                      child: const CircularProgressIndicator(
                                          color: kWhiteColor),
                                    )
                                    : const Text(
                                      "Envoyer",
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: kDefaultPadding * 1.5),
                            controller.commentaires!.isNotEmpty
                                ? const TextTitle(text: "Commentaires récents")
                                : Container(),
                            const SizedBox(height: kDefaultPadding),
                            ...List.generate(
                              controller.commentaires!.length,
                              (index) => Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(controller.commentaires![index]
                                            .username!.capitalizeFirst!,
                                        style: TextStyle(
                                          color: kBlackColor.withOpacity(0.8),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      subtitle: Text(
                                        controller.commentaires![index].contenu!
                                            .capitalizeFirst!,
                                        style: TextStyle(
                                          color: kBlackColor.withOpacity(0.48),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.grey[200],
                                        radius: 30,
                                        child: Icon(
                                          CupertinoIcons.person,
                                          size: 36,
                                          color: kBlackColor.withOpacity(0.2),
                                        ),
                                      ),
                                      trailing: Text("Le ${DateTime.parse(controller.commentaires![index].createdAt!.toString()).day.toString().padLeft(2, "0")}-${DateTime.parse(controller.commentaires![index].createdAt!.toString()).month.toString().padLeft(2, "0")}-${DateTime.parse(controller.commentaires![index].createdAt!.toString()).year.toString().padLeft(2, "0")}",
                                          style: TextStyle(
                                            color: kBlackColor.withOpacity(0.6),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      contentPadding:
                                          const EdgeInsets.only(left: 0),
                                    ),
                                    const Divider(
                                      thickness: 1.2,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ));
      }),
    );
  }
}
