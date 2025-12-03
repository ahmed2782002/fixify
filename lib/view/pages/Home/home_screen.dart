import 'package:fixify/constant/app_image.dart';
import 'package:fixify/view/pages/Home/widgets/categories_widget.dart';
import 'package:fixify/view/pages/Home/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: 20.h),

            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: 140.h,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage(AppImage.decBanner),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                Positioned(
                  right: 20,
                  child: Image.asset(
                    AppImage.banner,
                    height: 150.h,
                  ),
                ),


              ],
            ),
            SizedBox(height: 20.h),
            // Categories
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CategoriesWidget(),
            ),

            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
