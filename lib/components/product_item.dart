import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/core/app_sizes.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    this.onTap,
    this.item,
  }) : super(key: key);

  final Function()? onTap;
  final Produit? item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(
            left: kDefaultPadding / 1.8,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2),
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 80,
                width: 80,
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 3,
                      color: kBlackColor.withOpacity(0.3),
                    )
                  ],
                ),
                child: item!.imageUrl != null ? Image.network(item!.imageUrl!.toString(),
                    width: double.infinity, fit: BoxFit.fill) : Image.asset("assets/images/shoes.jpg",
                    width: double.infinity, fit: BoxFit.cover)),
            const SizedBox(height: 5,),
            Text(item!.nom!.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kBlackColor.withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }
}
