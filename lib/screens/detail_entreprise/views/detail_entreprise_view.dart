import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/detail_entreprise/controllers/detail_entreprise_controller.dart';

class EntrepriseDetailView extends GetView<EntrepriseDetailController> {
  const EntrepriseDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntrepriseDetailController>(builder: (controller) {
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
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: const Icon(
                                                CupertinoIcons.chevron_left,
                                                size: 26,
                                                color: kWhiteColor)),
                                        const Spacer(),
                                        Image.asset(
                                            "assets/images/D-SoftTechWhite.png",
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.cover),
                                        const SizedBox(width: 10),
                                      ]),
                                ),
                                const SizedBox(height: kDefaultPadding),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding - 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: const [
                                          Text(
                                            "Tel: +237 652 310 829",
                                            style: TextStyle(
                                              color: kWhiteColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Email: info@gmail.com",
                                            style: TextStyle(
                                              color: kWhiteColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          height: 75,
                                          width: 75,
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
                                              size: 60,
                                              color: kBlackColor
                                                  .withOpacity(0.5))),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding - 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Siège social: Yaoundé",
                                        style: TextStyle(
                                          color: kWhiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            "DouxSoftTech",
                                            style: TextStyle(
                                              color: kWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Informatique",
                                            style: TextStyle(
                                              color: kWhiteColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 2),
                              ],
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding - 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    color: kBlackColor.withOpacity(0.8),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 2),
                                Text(
                                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: kBlackColor.withOpacity(0.6),
                                    fontSize: 15,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding - 4),
                                Text(
                                  "Succursales",
                                  style: TextStyle(
                                    color: kBlackColor.withOpacity(0.8),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 2),
                                ...List.generate(
                                  3, (index) =>
                                Card(
                                  color: kWhiteColor,
                                  shadowColor: kWhiteColor,
                                  elevation: 1,
                                  child: Container(
                                    height: 60,
                                    padding: const EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Spacer(),
                                            Text(
                                              "DouxSoftTech",
                                              style: TextStyle(
                                                color: kBlackColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Yaoundé",
                                              style: TextStyle(
                                                color: kBlackColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: const [
                                            Spacer(),
                                            Text(
                                              "Tel: +237 652 310 829",
                                              style: TextStyle(
                                                color: kBlackColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              "Email: info@gmail.com",
                                              style: TextStyle(
                                                color: kBlackColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),
                                const SizedBox(height: kDefaultPadding - 4),
                                Text(
                                  "Site web",
                                  style: TextStyle(
                                    color: kBlackColor.withOpacity(0.8),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding / 2),
                                Row(
                                  children: [
                                    Image.asset("assets/icons/Icon-sitemap.png", height: 30, width: 30),
                                    const SizedBox(height: kDefaultPadding),
                                    Text("http://www.facebook.com",
                                      style: TextStyle(
                                        color: kBlackColor.withOpacity(0.6),
                                        fontSize: 15,
                                        height: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ]
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/icons/Icon-sitemap.png", height: 30, width: 30),
                                    const SizedBox(height: kDefaultPadding),
                                    Text("http://www.youtube.com",
                                      style: TextStyle(
                                        color: kBlackColor.withOpacity(0.6),
                                        fontSize: 15,
                                        height: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ]
                                ),
                                const SizedBox(height: kDefaultPadding*1.5),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/icons/Icon-facebook.png", height: 40, width: 40),
                                    const SizedBox(width: kDefaultPadding),
                                    Image.asset("assets/icons/Iconlogo-whatsapp.png", height: 40, width: 40),
                                    const SizedBox(width: kDefaultPadding),
                                    Image.asset("assets/icons/Icon-twitter.png", height: 40, width: 40),
                                    const SizedBox(width: kDefaultPadding),
                                  ]
                                ),
                                const SizedBox(height: kDefaultPadding*2),
                                

                              ],
                            ),
                          ),
                        ]),
                  ))));
    });
  }
}
