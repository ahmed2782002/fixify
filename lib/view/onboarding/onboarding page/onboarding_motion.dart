import 'package:fixify/constant/app_image.dart';
import 'package:flutter/material.dart';

import '../../../core/navigation.dart';
import '../Location/boarding_location.dart';
import '../widgets/onboarding_data.dart';
import '../widgets/onboarding_page.dart';
import 'onboarding_items.dart';

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
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImage.onboardingImage, fit: BoxFit.cover),
          ),

          SafeArea(
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingItems.length,
              itemBuilder: (context, index) {
                final item = onboardingItems[index];
                return OnboardingPage(
                  data: OnboardingData(
                    index: index,
                    page: page,
                    image: item.image,
                    title: item.title,
                    subtitle: item.subtitle,
                    nextLabel: item.nextLabel,
                    backLabel: item.backLabel,
                    backColor: item.backColor,

                    onNext: () {
                      if (index == onboardingItems.length - 1) {
                        navigateAndRemoveUntil(
                          context: context,
                          screen: BoardingLocation(),
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },

                    onBack: index == 0
                        ? null
                        : () {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
