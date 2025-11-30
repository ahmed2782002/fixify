import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

import '../../../constant/app_image.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/navigation.dart';
import '../../../constant/text_manager.dart';
import '../../Auth/login.dart';

class BoardingLocation extends StatelessWidget {
  const BoardingLocation({super.key});

  Future<void> getLocation(BuildContext context) async {
    final stopwatch = Stopwatch()..start();
    // print("Start getting location...");

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.all(20.0.sp),
            child: Container(
              padding: EdgeInsets.all(24.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  SpinKitFadingCircle(
                    color: ColorManager.primary2,
                    size: 50.0.sp,
                  ),
                  SizedBox(height: 16),

                ],
              ),
            ),
          ),
        ),
      ),
    );

    try {
      print("Checking if location service is enabled...");
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      print("Service enabled: $serviceEnabled");
      if (!serviceEnabled) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enable your location services")),
        );
        return;
      }

      print("Checking location permission...");
      LocationPermission permission = await Geolocator.checkPermission();
      print("Current permission: $permission");
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        print("Permission after request: $permission");
        if (permission == LocationPermission.denied) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Location permissions are denied")),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print("Permission denied forever");
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  "Location permissions are permanently denied. Please enable them in settings")),
        );
        return;
      }

      print("Getting current location...");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("Location obtained: ${position.latitude}, ${position.longitude}");

      Navigator.pop(context);
      stopwatch.stop();
      print("Time taken to navigate to Login: ${stopwatch.elapsedMilliseconds} ms");

      // الانتقال للـLogin مباشرة
      navigateTo(context: context, screen: Login());
    } catch (e) {
      Navigator.pop(context); // إزالة الـLoading
      print("Error getting location: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to get location")),
      );
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
              navigateTo(context: context, screen: Login());
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
