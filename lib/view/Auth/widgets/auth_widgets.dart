import 'package:fixify/view/Auth/widgets/otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color_manager.dart';
import '../../../constant/text_manager.dart';
import 'auth_header.dart';
import 'data_auth.dart';
import 'login_form_field.dart';

class AuthWidgets extends StatefulWidget {
  final AuthData data;
  final VoidCallback? onNext;
  final AuthHeader authHeader;

  final String type;
  const AuthWidgets({
    super.key,
    required this.data,
    required this.onNext,
    required this.authHeader,

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
            AuthHeader(
              data: widget.data,
              showBackButton: widget.authHeader.showBackButton,
              onBack: widget.authHeader.onBack,
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
                        text: widget.data.fieldLabel,
                        style: TextManager.heading2.copyWith(
                          fontWeight: FontWeight.w200,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '   Edit',
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
                    widget.data.fieldLabel,
                    style: TextManager.heading2.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: ColorManager.textPrimary,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 8.h),
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
                          const SnackBar(
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
              LoginFormField(controller: loginController!),
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
