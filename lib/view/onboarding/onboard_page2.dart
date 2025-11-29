import 'package:fixify/constant/app_image.dart';
import 'package:fixify/constant/color_manager.dart';
import 'package:fixify/view/onboarding/widgets/onboarding_data.dart';
import 'package:fixify/view/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';


class OnboardingPageTwo extends StatelessWidget {
  final double page;
  final int index;
  final PageController controller;

  const OnboardingPageTwo({
    super.key,
    required this.page,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingPage(
      page: page,
      index: index,
      data: OnboardingData(
        image: AppImage.onboarding2,
        title: "Schedule Your Way",
        subtitle: "Schedule your service at\nyour perfect time",
        nextLabel: "Next",
        backLabel: "Back",
        backColor: Colors.black,
      ),
      onNext: () => controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      ),
      onBack: () => controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      ),
    );
  }
}
