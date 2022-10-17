import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              color: kWhiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 110,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: kWhiteColor,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/top_banner.png"),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding, vertical: 0),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Row(children: [
                            const Icon(Icons.menu,
                                size: 46, color: kWhiteColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 32,
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(5, 4),
                                        blurRadius: 10,
                                        color: kBlackColor.withOpacity(0.3),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        kDefaultRadius * 10)),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    print(value);
                                  },
                                  style: const TextStyle(
                                    color: kBlackColor,
                                    decoration: TextDecoration.none,
                                  ),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "Saisir un mot clé...",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          bottom: 13, top: 0, left: 12)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(),
                                child: Image.asset(
                                    "assets/images/D-SoftTechWhite.png",
                                    fit: BoxFit.fill)),
                          ]),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: kDefaultPadding),
                    child: TextTitle(text: "Coach Sportif"),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(10, (index) => const CardItem())
                      ],
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  const Padding(
                    padding: EdgeInsets.only(left: kDefaultPadding),
                    child: TextTitle(text: "Bureaux d'étude"),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(10, (index) => const CardItem())
                      ],
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  const Padding(
                    padding: EdgeInsets.only(left: kDefaultPadding),
                    child: TextTitle(text: "Immobilier"),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(10, (index) => const CardItem())
                      ],
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding * 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: Get.width / 2,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(
          left: kDefaultPadding,
          bottom: kDefaultPadding,
          top: kDefaultPadding / 2),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultRadius * 1.2),
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 1),
            blurRadius: 5,
            color: kBlackColor.withOpacity(0.3),
          )
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            height: 120,
            width: Get.width / 2,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultRadius),
            ),
            child: Image.asset("assets/images/photo.jpg", fit: BoxFit.fill)),
        const SizedBox(height: 8),
        const Text("Chapeau Manequin",
          style: TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 3),
      Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no.",
          maxLines: 4,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: kBlackColor.withOpacity(0.6),
            height: 1.2,
            fontSize: 12,
          ),
        )
      ]),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key, required this.text}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text!,
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Container(
          height: 5,
          width: 50,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
