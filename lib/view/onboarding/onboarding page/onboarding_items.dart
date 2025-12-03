import 'package:flutter/material.dart';

import '../../../constant/app_image.dart';
import '../../../constant/color_manager.dart';
import '../widgets/onboarding_data.dart';

List<OnboardingData> onboardingItems = [
  OnboardingData(
    index: 0,
    page: 0,
    image: AppImage.onboarding1,
    title: "Find Trusted Experts",
    subtitle: "Finding the Most Experienced and\nTrusted People to Help You",
    nextLabel: "Next",
    backLabel: "Back",
    backColor: ColorManager.textThird,
    onNext: null,
    onBack: null,
  ),

  OnboardingData(
    index: 1,
    page: 1,
    image: AppImage.onboarding2,
    title: "Schedule Your Way",
    subtitle: "Schedule your service at\nyour perfect time",
    nextLabel: "Next",
    backLabel: "Back",
    backColor: Colors.black,
    onNext: null,
    onBack: null,
  ),

  OnboardingData(
    index: 2,
    page: 2,
    image: AppImage.onboarding3,
    title: "Stay Connected",
    subtitle: "Chat or call your tasker to\nfine-tune every detail",
    nextLabel: "Get Started",
    backLabel: "Back",
    backColor: Colors.black,
    onNext: null,
    onBack: null,
  ),
];
