import 'dart:async';

import 'package:fixify/view/onboarding/onboarding%20page/onboarding_motion.dart';
import 'package:flutter/material.dart';

import 'constant/app_image.dart';
import 'core/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      navigateAndReplace(context: context,
     screen: const OnboardingMotion(),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:  Image.asset(
        AppImage.splashImage,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    )
    );
  }
}
