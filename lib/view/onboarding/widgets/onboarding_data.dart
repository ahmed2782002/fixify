import 'dart:ui';

class OnboardingData {
  final String image;
  final String title;
  final String subtitle;
  final String nextLabel;
  final String backLabel;
  final Color backColor;

  OnboardingData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.nextLabel,
    required this.backLabel,
    required this.backColor,
  });
}
