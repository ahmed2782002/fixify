import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/text_manager.dart';
import 'data_auth.dart';

class AuthHeader extends StatelessWidget {
  final AuthData data;
  final bool showBackButton;
  final VoidCallback? onBack;

  const AuthHeader({
    super.key,
    required this.data,
    this.showBackButton = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (showBackButton)
              InkWell(
                onTap: onBack,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            Expanded(
              child: Center(
                child: Image.asset(data.image, width: 186.w, height: 38.h),
              ),
            ),
            if (showBackButton) const SizedBox(width: 25),
          ],
        ),
        SizedBox(height: 46.h),
        Text(data.title, style: TextManager.heading1.copyWith(fontSize: 24.sp)),
        SizedBox(height: 16.h),
        Text(
          data.subtitle,
          style: TextManager.heading2.copyWith(
            color: const Color(0XFF545E64),
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
