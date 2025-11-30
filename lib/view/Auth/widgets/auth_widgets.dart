import 'package:fixify/view/Auth/widgets/otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color_manager.dart';
import '../../../constant/text_manager.dart';
import 'data_auth.dart';

class AuthWidgets extends StatefulWidget {
  final AuthData data;
  final VoidCallback? onNext;
  final bool showBackButton;
  final VoidCallback? onBack;
  final String type; // "login" أو "otp"

  const AuthWidgets({
    super.key,
    required this.data,
    required this.onNext,
    this.showBackButton = false,
    this.onBack,
    this.type = "login",
  });

  @override
  State<AuthWidgets> createState() => _AuthWidgetsState();
}

class _AuthWidgetsState extends State<AuthWidgets> {
  TextEditingController? loginController;
  final formKey = GlobalKey<FormState>();
  bool isOtpComplete = false;

  @override
  void initState() {
    super.initState();
    if (widget.type == "login") {
      loginController = TextEditingController();
    }
  }

  @override
  void dispose() {
    loginController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                if (widget.showBackButton)
                  InkWell(
                    onTap: widget.onBack,
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      widget.data.image,
                      width: 186.w,
                      height: 38.h,
                    ),
                  ),
                ),
                if (widget.showBackButton) const SizedBox(width: 25),
              ],
            ),

            SizedBox(height: 46.h),
            //title
            Text(
              widget.data.title,
              style: TextManager.heading1.copyWith(fontSize: 24.sp),
            ),

            SizedBox(height: 16.h),

            //subtitle
            Text(
              widget.data.subtitle,
              style: TextManager.heading2.copyWith(
                color: const Color(0XFF545E64),
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30.h),

            if (widget.type == "otp")
              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '+1-(954) 673-5555 ',
                        style: TextManager.heading2.copyWith(
                          fontWeight: FontWeight.w200,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Edit',
                        style: TextManager.heading2.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: ColorManager.secondary2,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Enter your Phone or Email",
                    style: TextManager.heading2.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: ColorManager.textPrimary,
                    ),
                  ),
                ),
              ),

            SizedBox(height: 8.h),

            // OTP or Login Field
            if (widget.type == "otp")
              Column(
                children: [
                  OtpWidget(
                    onOtpChanged: (complete) {
                      setState(() {
                        isOtpComplete = complete;
                      });
                    },
                    onCompleted: (code) {
                      if (code == "12345") {
                        widget.onNext?.call();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Invalid OTP code"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  if (!isOtpComplete)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn’t receive any code?",
                          style: TextManager.heading2.copyWith(
                            color: ColorManager.textPrimary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Resend code",
                            style: TextManager.bodyText.copyWith(
                              color: ColorManager.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: loginController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "example@gmail.com",
                    hintStyle: TextStyle(
                      color: ColorManager.textPrimary,
                      fontSize: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFDBDFE1),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFDBDFE1),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
              ),

            SizedBox(height: 60.h),

            ElevatedButton(
              onPressed: () {
                if (widget.type != "otp") {
                  if (formKey.currentState!.validate()) {
                    widget.onNext?.call();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.type == "otp"
                    ? (isOtpComplete ? ColorManager.primary2 : Colors.grey)
                    : ColorManager.primary2,
                fixedSize: Size(342.w, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                widget.data.buttonText,
                style: TextManager.buttonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
