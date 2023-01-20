import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/screens/contacts/controllers/contact_controller.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ContactsController>(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back,
                      size: 26, color: Colors.white)),
              title: const Text("Contacts"),
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
                    Text(
                      "Pour tout autre besoin, contactez-nous ici",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: kBlackColor.withOpacity(0.8),
                          fontSize: 16,
                          height: 1.5,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: kDefaultPadding * 1.5,
                    ),
                    Container(
                      height: 45,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: kBlackColor.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset("assets/icons/Iconlogo-whatsapp.png",
                              height: 25,
                              width: 25,
                              color: kPrimaryColor.withOpacity(0.9)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "(+237) 693 76 65 21",
                            style: TextStyle(color: kBlackColor, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding - 4,
                    ),
                    Container(
                      height: 45,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: kBlackColor.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(CupertinoIcons.mail,
                              size: 26, color: kPrimaryColor),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "mdmscoopsinfos@mdmsite.com",
                            style: TextStyle(color: kBlackColor, fontSize: 16),
                          )
                        ],
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
