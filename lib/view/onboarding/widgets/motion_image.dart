import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MotionImage extends StatelessWidget {
  final String image;
  final double page;
  final int index;
  final double width;
  final double height;

  const MotionImage({
    super.key,
    required this.image,
    required this.page,
    required this.index,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    double delta = page - index;
    double parallaxX = delta * -50.w;
    double parallaxY = delta * 20.h;

    double scale = 1 - (delta.abs() * 0.25);

    return Transform(
      transform: Matrix4.identity()
        ..translate(parallaxX, parallaxY)
        ..scale(scale),
      child: Image.asset(
        image,
        width: width.w,
        height: height.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
