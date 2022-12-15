import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';

class SelectCountryCode extends StatelessWidget {
  const SelectCountryCode({
    Key? key,
    required this.controller,
    this.textController,
    this.onChanged,
  }) : super(key: key);

  final dynamic controller;
  final TextEditingController? textController;
  final Function(String data)? onChanged;

  @override
  Widget build(BuildContext context) {
    const countryPicker = FlCountryCodePicker();
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 0.8,
          color: kPrimaryColor.withOpacity(0.2),
        ),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: textController,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: "Numéro de téléphone",
          border: InputBorder.none,
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () async {
                controller.countryCode = await countryPicker.showPicker(
                  context: context,
                  scrollToDeviceLocale: true,
                  initialSelectedLocale: "Cameroon"
                );
                controller.update();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: kPrimaryColor,
                      ),
                      child: Text(
                        controller.countryCode != null
                            ? controller.countryCode!.dialCode
                            : "+237",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                ],
              ),
            ),
          ),
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
