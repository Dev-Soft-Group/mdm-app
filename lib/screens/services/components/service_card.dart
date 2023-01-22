import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/models/response_model/services_models.dart';
import 'package:mdmscoops/routes/app_routes.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.service,
    this.logoHeight,
    this.maxLinesContent,
    this.maxLinesTitle,
  });

  final Service service;
  final double? logoHeight;
  final int? maxLinesContent;
  final int? maxLinesTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.SERVICES_DETAIL, arguments: {"service": service});
      },
      onLongPress: () async {
        Get.toNamed(AppRoutes.CREATE_SERVICE, arguments: {"service": service});
      },
      child: Card(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: logoHeight ?? 50,
                  width: logoHeight ?? 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: kBlackColor.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: service.imageUrl!.toString(),
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
                const SizedBox(height: kDefaultPadding),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(service.nom!.toString().capitalizeFirst!,
                            maxLines: maxLinesTitle ?? 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            )),
                        Text(service.description.toString().capitalizeFirst!,
                            textAlign: TextAlign.justify,
                            maxLines: maxLinesContent ?? 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
