import 'package:fixify/constant/app_image.dart';
import 'package:fixify/constant/color_manager.dart';
import 'package:fixify/constant/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primary3,
      height: 237.h,
      padding: EdgeInsets.all(20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageIcon(
                    AssetImage(AppImage.locationIcon),
                    color: Colors.white,
                    size: 24,
                  ),

                  SizedBox(width: 6),
                  Text(
                    "New York",
                    style: TextManager.heading2.copyWith(color: Colors.white),
                  ),
                ],
              ),
              ImageIcon(
                AssetImage(AppImage.notification),
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Text(
            "I need help with",
            style: TextManager.buttonText.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20.h),
          // Search Field
          SizedBox(
            height: 46.h,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor: Colors.white,
                hintText: "What do you need help with",
                hintStyle: TextManager.bodyText.copyWith(
                  color: ColorManager.textThird,
                  fontSize: 14.sp,
                ),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
