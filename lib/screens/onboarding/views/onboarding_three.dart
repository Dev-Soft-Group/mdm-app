


import 'package:flutter/material.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold(
        body: Container(
          decoration: const  BoxDecoration(),
          child: const Text("Onboarding"),
        ),
      ),
    );
  }
}