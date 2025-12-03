import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

import '../../../constant/app_image.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/text_manager.dart';
import '../../../core/navigation.dart';
import '../../Auth/login.dart';

class BoardingLocation extends StatelessWidget {
  const BoardingLocation({super.key});

  Future<void> getLocation(BuildContext context) async {
    // عرض Loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: Container(
              padding: EdgeInsets.all(24.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitFadingCircle(
                    color: ColorManager.primary2,
                    size: 50.0.sp,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Getting your location...",
                    style: TextManager.bodyText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    try {
      // التحقق من خدمة الموقع
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Navigator.pop(context); // إزالة الـ Loading
        await Geolocator.openLocationSettings(); // فتح إعدادات الموقع
        return;
      }

      // التحقق من صلاحيات الموقع
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Navigator.pop(context);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  "Location permissions are permanently denied. Please enable them in settings")),
        );
        return;
      }

      // الحصول على الموقع الحالي
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      Navigator.pop(context); // إزالة الـ Loading

      // الانتقال مباشرة للـ Login
      navigateTo(context: context, screen: const Login());
    } catch (e) {
      Navigator.pop(context); // إزالة الـ Loading
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to get location")),
      );
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImage.location,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20.h),
          Text(
            "What is your Location?",
            style: TextManager.heading1.copyWith(fontSize: 24.sp),
          ),
          SizedBox(height: 15.h),
          Text(
            "We need access to your location\n to suggest relevant nearby services",
            style: TextManager.bodyText,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.h),
          OutlinedButton(
            onPressed: () => getLocation(context),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: ColorManager.primary2, width: 1.5.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 16.h),
            ),
            child: Text(
              "Allow location access",
              style:
              TextManager.buttonText.copyWith(color: ColorManager.primary2),
            ),
          ),
          SizedBox(height: 28.h),
          TextButton(
            onPressed: () {
              navigateTo(context: context, screen: const Login());
            },
            child: Text(
              "Enter location manually",
              style:
              TextManager.buttonText.copyWith(color: ColorManager.primary2),
            ),
          ),
        ],
      ),
    );
  }
}
