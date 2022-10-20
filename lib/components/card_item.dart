
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
            const Text(
              "Chapeau Manequin",
              style: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no.",
              maxLines: 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kBlackColor.withOpacity(0.6),
                height: 1.2,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(onTap: (){}, child: Icon(CupertinoIcons.heart, size: 26, color: kPrimaryColor.withOpacity(0.8))),
                const SizedBox(width: 8),
                InkWell(onTap: (){}, child:Icon(Icons.comment_outlined, size: 26, color: kPrimaryColor.withOpacity(0.8))),
                const SizedBox(width: 8),
                InkWell(onTap: (){}, child:Icon(Icons.share, size: 26, color: kPrimaryColor.withOpacity(0.8))),
                const SizedBox(width: 8),
                InkWell(onTap: (){}, child:Icon(Icons.more_vert_outlined, size: 26, color: kPrimaryColor.withOpacity(0.8))),
              ],
            ),
          ]),
        ),
        Positioned(
          top: 100,
          left: 35,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kWhiteColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 1),
                  blurRadius: 5,
                  color: kBlackColor.withOpacity(0.3),
                )
              ],
            ),
            child: Icon(Icons.person, size: 40, color: kBlackColor.withOpacity(0.5))
          ),
        ),
      ],
    );
  }
}