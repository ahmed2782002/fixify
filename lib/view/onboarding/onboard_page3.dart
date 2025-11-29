import 'package:fixify/constant/app_image.dart';
import 'package:fixify/constant/navigation.dart';
import 'package:fixify/view/onboarding/boarding_location.dart';
import 'package:fixify/view/onboarding/widgets/onboarding_data.dart';
import 'package:fixify/view/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';


class OnboardingPageThree extends StatelessWidget {
  final double page;
  final int index;
  final PageController controller;

  const OnboardingPageThree({
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
        image: AppImage.onboarding3,
        title: "Stay Connected",
        subtitle: "Chat or call your tasker to\nfine-tune every detail",
        nextLabel: "Get Started",
        backLabel: "Back",
        backColor: Colors.black,
      ),
      onNext: () {
        navigateAndRemoveUntil(
          context: context,
          screen: BoardingLocation(),
        );
      },
      onBack: () => controller.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      ),
    );
  }
}
