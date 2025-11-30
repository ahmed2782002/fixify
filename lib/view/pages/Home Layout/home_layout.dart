import 'dart:ui';

import 'package:fixify/constant/color_manager.dart';
import 'package:fixify/view/pages/Home%20Layout/widgets/nav_item.dart';
import 'package:fixify/view/pages/Home/home_screen.dart';
import 'package:fixify/view/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../List/list_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ListScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(64.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                color: const Color(0x30EDF5F7),
                border: Border.all(color: ColorManager.primary1),
                borderRadius: BorderRadius.circular(64),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavItem(
                    index: 0,
                    selectedIndex: selectedIndex,
                    icon: 'assets/icons/home.png',
                    activeIcon: 'assets/icons/home_w.png',
                    onTap: () {
                      setState(() => selectedIndex = 0);
                    },
                  ),
                  NavItem(
                    index: 1,
                    selectedIndex: selectedIndex,
                    icon: 'assets/icons/icon_list.png',
                    activeIcon: 'assets/icons/icon_list_w.png',
                    onTap: () {
                      setState(() => selectedIndex = 1);
                    },
                  ),
                  NavItem(
                    index: 2,
                    selectedIndex: selectedIndex,
                    icon: 'assets/icons/user1.png',
                    activeIcon: 'assets/icons/User_w.png',
                    onTap: () {
                      setState(() => selectedIndex = 2);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
