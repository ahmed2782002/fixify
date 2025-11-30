import 'package:fixify/constant/app_image.dart';
import 'package:flutter/material.dart';

import 'onboard_page1.dart';
import 'onboard_page2.dart';
import 'onboard_page3.dart';


class OnboardingMotion extends StatefulWidget {
  const OnboardingMotion({super.key});

  @override
  State<OnboardingMotion> createState() => _OnboardingMotionState();
}

class _OnboardingMotionState extends State<OnboardingMotion> {
  final PageController controller = PageController();
  double page = 0.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() => page = controller.page ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingPageOne(page: page, index: 0, controller: controller),
      OnboardingPageTwo(page: page, index: 1, controller: controller),
      OnboardingPageThree(page: page, index: 2, controller: controller),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImage.onboardingImage,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: PageView(
              controller: controller,
              children: pages,
            ),
          )
        ],
      ),
    );
  }
}
