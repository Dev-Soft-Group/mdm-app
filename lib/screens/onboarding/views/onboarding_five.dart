


import 'package:flutter/material.dart';

class OnboardingFive extends StatelessWidget {
  const OnboardingFive({Key? key}) : super(key: key);

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