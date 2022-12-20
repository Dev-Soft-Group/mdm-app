import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';
import 'package:mdmscoops/models/response_model/succursale_model.dart';

class SuccursaleCard extends StatelessWidget {
  const SuccursaleCard({super.key, required this.succursale});

  final Succursale succursale;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              children: [
                const Spacer(),
                Text(
                  succursale.nom!.toString(),
                  style: TextStyle(
                    color: kBlackColor.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  succursale.localisation!.toString(),
                  style: TextStyle(
                    color: kBlackColor.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Text(
                  "Tel: ${succursale.telephone!}",
                  style: TextStyle(
                    color: kBlackColor.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "Email: ${succursale.email!}",
                  style: TextStyle(
                    color: kBlackColor.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
