import 'package:fixify/constant/app_image.dart';
import 'package:fixify/constant/color_manager.dart';
import 'package:fixify/view/onboarding/widgets/onboarding_data.dart';
import 'package:fixify/view/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingPageOne extends StatelessWidget {
  final double page;
  final int index;
  final PageController controller;

  const OnboardingPageOne({
    super.key,
    required this.page,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final onboardingData = OnboardingData(
      index: index,
      page: page,
      image: AppImage.onboarding1,
      title: "Find Trusted Experts",
      subtitle: "Finding the Most Experienced and\nTrusted People to Help You",
      nextLabel: "Next",
      backLabel: "Back",
      backColor: ColorManager.textThird,
      onNext: () => controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      ),
      onBack: null,
    );

    return OnboardingPage(data: onboardingData);
  }
}
