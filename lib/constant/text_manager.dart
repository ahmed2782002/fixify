import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_manager.dart';

class TextManager {
  static TextStyle heading1 = GoogleFonts.inter(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,// Semi Bold
    color: ColorManager.textPrimary,
  );

  static TextStyle heading2 = GoogleFonts.inter(
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,

  );

  static TextStyle bodyText = GoogleFonts.inter(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    color: ColorManager.textSecondary,
  );

  static TextStyle buttonText = GoogleFonts.inter(
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
    color: ColorManager.primary1,
  );
}
