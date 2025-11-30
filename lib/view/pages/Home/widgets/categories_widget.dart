import 'package:fixify/constant/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/app_image.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> categories = [
      {"title": "Home repairs", "icon": AppImage.homeRepair},
      {"title": "Cleaning", "icon": AppImage.cleaning},
      {"title": "Handyman", "icon": AppImage.handyman},
      {"title": "Moving", "icon": AppImage.moving},
      {"title": "Outdoor", "icon": AppImage.outdoor},
      {"title": "Vehicle Services", "icon": AppImage.vehicle},
      {"title": "Appliances", "icon": AppImage.appliances},
      {"title": "Pet Control", "icon": AppImage.pet},
      {"title": "Special Services", "icon": AppImage.special},
      {"title": "Assembly", "icon": AppImage.assembly},
      {"title": "Tech Support", "icon": AppImage.tech},
      {"title": "Security services", "icon": AppImage.security},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextManager.heading1.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12.h),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categories[index]["icon"]!,
                    width: 50.w,
                    height: 50.h,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    categories[index]["title"]!,
                    textAlign: TextAlign.center,
                    style: TextManager.text,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
