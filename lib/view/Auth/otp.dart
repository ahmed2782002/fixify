import 'package:fixify/view/Auth/widgets/auth_widgets.dart';
import 'package:fixify/view/Auth/widgets/data_auth.dart';
import 'package:fixify/view/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_image.dart';
import '../../constant/color_manager.dart';
import '../../constant/navigation.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthData loginData = AuthData(
      image: AppImage.logo,
      title: "Enter Veritification Code",
      subtitle: "We sent a verification code to your phone number",
      fieldLabel: "+1-(954) 673-5555 Edit",
      buttonText: "Verify and Continue",
    );

    return Scaffold(
      backgroundColor: ColorManager.primary1,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 120.h , ),
          child: AuthWidgets(
            data: loginData,
            type: "otp",             // مهم: لضمان ظهور فيلد login
            showBackButton: false,      // تفعيل السهم للعودة
            onBack: () => Navigator.pop(context),
            onNext: () {
              // الانتقال لصفحة OTP بعد الضغط على Continue
              navigateAndReplace(
                context: context,
                screen: HomeScreen(),
              );
            },
          ),
        ),
      ),
    );
  }
}
