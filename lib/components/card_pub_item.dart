import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/models/response_model/publication_model.dart';

class CardPubItem extends StatelessWidget {
  const CardPubItem(
      {Key? key,
      this.item,
      this.width,
      this.onTap,
      this.onLongPress,
      this.onMessage,
      this.left,
      this.bottom,
      this.bottomLeft,
      this.containerHeight,
      this.imageHeight,
      this.logoTop})
      : super(key: key);
  final double? width;
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onMessage;
  final double? left;
  final double? bottom;
  final double? bottomLeft;
  final double? containerHeight;
  final double? imageHeight;
  final double? logoTop;
  final Publication? item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onLongPress,
      child: Stack(
        children: [
          Container(
            height: containerHeight ?? 240,
            width: width ?? Get.width / 2,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(
                left: left ?? kDefaultPadding,
                bottom: bottom ?? kDefaultPadding,
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: imageHeight ?? 120,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                ),
                child: CachedNetworkImage(
                  imageUrl: item!.imageUrl!.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              Colors.transparent, BlendMode.colorBurn)),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 36),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item!.titre!.toString().capitalizeFirst!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                item!.description!.toString().capitalizeFirst!,
                maxLines: 3,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: kBlackColor.withOpacity(0.6),
                  height: 1.2,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(item!.likes!.toString(),
                            style: const TextStyle(fontSize: 13)
                          ),
                          const SizedBox(width: 5),
                          Icon(CupertinoIcons.hand_thumbsup,
                              size: 20, color: kPrimaryColor.withOpacity(0.8)),
                        ],
                      )),
                  const SizedBox(width: 15),
                  InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(item!.commentaires!.toString(),
                            style: const TextStyle(fontSize: 13)
                          ),
                          const SizedBox(width: 5),
                          Icon(Icons.comment_outlined,
                              size: 20, color: kPrimaryColor.withOpacity(0.8)),
                        ],
                      )),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: onMessage ?? () {},
                    child: Image.asset("assets/icons/Iconlogo-whatsapp.png",
                        height: 18, width: 18, color: kPrimaryColor.withOpacity(0.9)),
                  ),
                   const SizedBox(width: 8),
                ],
              ),
            ]),
          ),
          Positioned(
            top: logoTop ?? 100,
            left: bottomLeft ?? 35,
            child: Container(
                height: 40,
                width: 40,
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
                child: item!.entreprise != null
                    ? Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: item!.entreprise!.logoUrl!.toString(),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.transparent, BlendMode.colorBurn)),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, size: 36),
                        ),
                      )
                    : Icon(Icons.person,
                        size: 36, color: kBlackColor.withOpacity(0.5))),
          ),
        ],
      ),
    );
  }
}
