


import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const Icon(Icons.menu, size: 46, color: kWhiteColor),
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
                      borderRadius: BorderRadius.circular(kDefaultRadius * 10)),
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
                        contentPadding:
                            EdgeInsets.only(bottom: 13, top: 0, left: 12)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(),
                  child: Image.asset("assets/images/D-SoftTechWhite.png",
                      fit: BoxFit.fill)),
            ]),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
