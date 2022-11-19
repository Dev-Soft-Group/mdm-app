import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdmscoops/core/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  final dynamic controller;
  final List liste;
  final String selectedItem;
  final Function(dynamic data) onChanged;
  final String helpText;
  const CustomDropDown({
    Key? key,
    required this.controller,
    required this.liste,
    required this.selectedItem,
    required this.onChanged,
    required this.helpText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        helpText != "no" ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              helpText,
              style: TextStyle(
                  color: kBlackColor.withOpacity(0.7),
                  fontSize: 15),
            ),
            const SizedBox(height: 5),
          ],
        ): Container(),
        Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.2,
                color: Colors.grey.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButton<dynamic>(
            value: selectedItem,
            icon: const Icon(CupertinoIcons.chevron_down, size: 20),
            elevation: 16,
            isExpanded: true,
            style:
                TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16),
            underline: Container(
              height: 0,
              width: 0,
              color: Colors.black,
            ),
            onChanged: (dynamic newValue) {
              onChanged(newValue);
            },
            items: liste.map<DropdownMenuItem<dynamic>>((dynamic value) {
              return DropdownMenuItem<dynamic>(
                value: value['libelle'],
                child: Text(value['libelle']),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
