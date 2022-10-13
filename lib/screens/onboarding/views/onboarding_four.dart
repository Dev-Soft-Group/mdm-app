


import 'package:flutter/material.dart';

class OnboardingFour extends StatelessWidget {
  const OnboardingFour({Key? key}) : super(key: key);

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