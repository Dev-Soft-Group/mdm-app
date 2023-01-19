import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/apropos/controllers/apropos_controller.dart';

class AproposView extends GetView<AproposController> {
  const AproposView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AproposController>(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              leading: InkWell(
                onTap: (){Get.back();},
                child: const Icon(Icons.arrow_back, size: 26, color: Colors.white)
              ),
              title: const Text("A propos"),
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
            body: Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: const BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kDefaultPadding * 1.5,
                    ),
                    Text("Accompagnement, appui,coachings, conseils y compris le financement. Nous amenons les entrepreneurs à pouvoir coaliser  les efforts dans tous ses aspects techniques du front commun : partenariats ou en associé ; prestations de services ; représentation ; exposition vente. Nous aidons également d'une manière spécifique, l'élaboration des protocoles accord ou des contrats de partenariat entre les membres.",
                    textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: kBlackColor.withOpacity(0.8),
                        fontSize: 16,
                        height: 1.5,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding * 1.5,
                    ),
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
