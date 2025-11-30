import 'dart:ui';

import 'package:flutter/material.dart';

class OnboardingData {
  final int index;
  final double page;
  final String image;
  final String title;
  final String subtitle;
  final String nextLabel;
  final String backLabel;
  final Color backColor;
  final VoidCallback? onNext;
  final VoidCallback? onBack;

  OnboardingData({
    required this.index,
    required this.page,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.nextLabel,
    required this.backLabel,
    required this.backColor,
    this.onNext,
    this.onBack,
  });
}
