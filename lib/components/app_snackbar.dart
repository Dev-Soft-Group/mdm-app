import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void show({String? title, message, Color? backColor, foreColor}) {
    Get.snackbar(
      title!,
      message!,
      colorText: foreColor ?? Colors.white,
      backgroundColor: backColor ?? Colors.red,
    );
  }
}
