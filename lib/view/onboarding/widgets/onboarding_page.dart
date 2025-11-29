import 'package:fixify/constant/navigation.dart';
import 'package:fixify/view/onboarding/boarding_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/text_manager.dart';
import 'motion_image.dart';
import 'onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  final double page;
  final int index;
  final OnboardingData data;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  const OnboardingPage({
    super.key,
    required this.page,
    required this.index,
    required this.data,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    navigateAndRemoveUntil(
                      context: context,
                      screen: BoardingLocation(),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        "Skip",
                        style: TextManager.buttonText.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 17.sp,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 110.h),

          MotionImage(
            image: data.image,
            page: page,
            index: index,
            width: 250.w,
            height: 260.h,
          ),

          SizedBox(height: 35.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                height: 5.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: i == page.round()
                      ? ColorManager.secondary2
                      : const Color(0XFFDBDFE1),
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ),

          SizedBox(height: 24.h),

          Text(
            data.title,
            style: TextManager.heading1,
          ),

          SizedBox(height: 24.h),

          Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: TextManager.bodyText,
          ),

          SizedBox(height: 45.h),

          Column(
            children: [
              ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary2,
                  fixedSize: Size(342.w, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  data.nextLabel,
                  style: TextManager.buttonText,
                ),
              ),

              SizedBox(height: 14.h),

              TextButton(
                onPressed: onBack,
                child: Text(
    data.backLabel ,
                  style: TextManager.heading2.copyWith(
                    color: data.backColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
