import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/screens/onboarding/views/onboarding_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MDM-SCOOPS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingOne(),
    );
  }
}


