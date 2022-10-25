

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }
}