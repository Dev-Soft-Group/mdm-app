import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/onboarding/controllers/ondoarding_controller.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    Key? key,
    required this.control,
    required this.title,
    required this.child,
    this.back,
    this.next,
    this.subtitle,
  }) : super(key: key);

  final OnboardingController control;
  final String title;
  final Widget child;
  final Widget? subtitle;
  final Widget? back;
  final Widget? next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Column(
          children: [
            const SizedBox(height: kDefaultPadding * 2),
            Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Image.asset("assets/images/D-SoftTechWhite.png",
                    fit: BoxFit.fill)),
            const SizedBox(height: kDefaultPadding * 6),
            Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultRadius * 9)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: kDefaultPadding * 4.2),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                          ),
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              child,
                              subtitle ?? Container(),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          back ?? Container(),
                          next!,
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
