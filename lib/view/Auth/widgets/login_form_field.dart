import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color_manager.dart';
import '../../../core/auth_validator.dart';

class LoginFormField extends StatelessWidget {
  final TextEditingController controller;

  const LoginFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "example@gmail.com",
          hintStyle: TextStyle(color: ColorManager.textPrimary, fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Color(0xFFDBDFE1), width: 1.5.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Color(0xFFDBDFE1), width: 2.w),
          ),
        ),
        validator: AuthValidator.validateEmail,
      ),
    );
  }
}
