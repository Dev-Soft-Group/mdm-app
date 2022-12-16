import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/card_pub_item.dart';
import 'package:mdmscoops/components/textTitle.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/screens/profil_entrepreneur/controllers/profil_entrepreneur_controller.dart';

class ProfilEntrepreneurView extends GetView<ProfilEntrepreneurController> {
  const ProfilEntrepreneurView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilEntrepreneurController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                  ),
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // height: 180,
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 16,
                                  ),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: const Icon(
                                                Icons.chevron_left,
                                                size: 36,
                                                color: kWhiteColor)),
                                        const SizedBox(width: 15),
                                        const Text(
                                          "Profil",
                                          style: TextStyle(
                                            color: kWhiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                                Icons.more_vert_outlined,
                                                size: 26,
                                                color: kWhiteColor),
                                          ),
                                        ),
                                      ]),
                                ),
                                const SizedBox(height: kDefaultPadding),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding - 4),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kWhiteColor,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(2, 1),
                                                blurRadius: 5,
                                                color: kBlackColor
                                                    .withOpacity(0.3),
                                              )
                                            ],
                                          ),
                                          child: Icon(Icons.person,
                                              size: 50,
                                              color: kBlackColor
                                                  .withOpacity(0.5))),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "DouxSoftTech",
                                            style: TextStyle(
                                              color: kWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: const [
                                              Text(
                                                "Tel: +237 652 310 829",
                                                style: TextStyle(
                                                  color: kWhiteColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                "Email: info@gmail.com",
                                                style: TextStyle(
                                                  color: kWhiteColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding * 1.5),
                              ],
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding - 4),
                            decoration: const BoxDecoration(),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.menus.length,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        controller.onTabChange(index);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: kDefaultPadding * 1.2,
                                            top: kDefaultPadding / 3,
                                            bottom: kDefaultPadding / 3),
                                        child: Text(
                                          controller.menus[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: controller.selectedTabs ==
                                                    index
                                                ? kBlackColor
                                                : kBlackColor.withOpacity(0.4),
                                            fontWeight:
                                                controller.selectedTabs == index
                                                    ? FontWeight.w600
                                                    : FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding - 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: kDefaultPadding),
                                Container(
                                  height: 80,
                                  decoration: const BoxDecoration(),
                                  child: GridView.count(
                                      crossAxisCount: 2,
                                      shrinkWrap: true,
                                      childAspectRatio: 7 / 3,
                                      mainAxisSpacing: kDefaultPadding - 5,
                                      crossAxisSpacing: kDefaultPadding - 5,
                                      children: [
                                        Card(
                                          color: kWhiteColor,
                                          shadowColor: kWhiteColor,
                                          elevation: 1,
                                          child: Container(
                                            height: 60,
                                            padding: const EdgeInsets.all(10.0),
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(controller.publicationsList.length.toString().padLeft(2, "0"),
                                                  style: const TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  "Publications",
                                                  style: TextStyle(
                                                    color: kBlackColor
                                                        .withOpacity(0.5),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: kWhiteColor,
                                          shadowColor: kWhiteColor,
                                          elevation: 1,
                                          child: Container(
                                            height: 60,
                                            padding: const EdgeInsets.all(10.0),
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "30",
                                                  style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  "Total produits",
                                                  style: TextStyle(
                                                    color: kBlackColor
                                                        .withOpacity(0.5),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                const SizedBox(height: kDefaultPadding - 4),
                                const TextTitle(text: "Publications récentes"),
                                const SizedBox(height: kDefaultPadding/2),
                                controller.publicationStatus == AppStatus.appLoading ?
                                Container(
                                  height: 270,
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator( color: kPrimaryColor.withOpacity(0.4))
                                ):
                                controller.publicationsList.isNotEmpty ? Container(
                                    height: 228,
                                    decoration: const BoxDecoration(),
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(children:
                                          List.generate(controller.publicationsList.length, 
                                          (index)=>Padding(
                                                padding: const EdgeInsets.only(
                                                    right: kDefaultPadding - 5),
                                                child: CardPubItem(
                                                  onMessage: () async { await controller.sendWhatsAppMessenger(controller.publicationsList[index]);},
                                                  item: controller
                                                      .publicationsList[index],
                                                  width: Get.width / 1.85 - 25,
                                                  left: 0,
                                                  bottom: 0,
                                                  bottomLeft:
                                                      kDefaultPadding - 4,
                                                  containerHeight: 212,
                                                  imageHeight: 100,
                                                )))
                                        )
                                            )):  Container(
                                  height: 270,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding*1.5),
                                  child: Text("Vous n'avez encore aucune publication pour le moment",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: kBlackColor.withOpacity(0.6)
                                    ),
                                  )
                                ),
                                const SizedBox(height: kDefaultPadding * 2),
                              ],
                            ),
                          ),
                        ]),
                  ))));
    });
  }
}
