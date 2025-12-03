import 'package:fixify/constant/app_image.dart';
import 'package:fixify/constant/color_manager.dart';
import 'package:fixify/core/navigation.dart';
import 'package:fixify/view/Auth/otp.dart';
import 'package:fixify/view/Auth/widgets/auth_header.dart';
import 'package:fixify/view/Auth/widgets/auth_widgets.dart';
import 'package:fixify/view/Auth/widgets/data_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthData loginData = AuthData(
      image: AppImage.logo,
      title: "Continue with Phone or Email",
      subtitle: "Login or create an account",
      fieldLabel: "Enter your Phone or Email",
      buttonText: "Continue",
    );
    return Scaffold(
      backgroundColor: ColorManager.primary1,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 120.h),
          child: AuthWidgets(
            data: loginData,
            type: "login",
            authHeader: AuthHeader(
              data: loginData,
              showBackButton: true,
              onBack: () => Navigator.pop(context),
            ),
            onNext: () {
              navigateAndReplace(
                context: context,
                screen: OTP(),
              );
            },
          ),
        ),
      ),
    );
  }
}
