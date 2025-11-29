import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/text_manager.dart';

class OtpWidget extends StatefulWidget {
  final Function(String code)? onCompleted;
  final Function(bool isComplete)? onOtpChanged;

  const OtpWidget({super.key, this.onCompleted, this.onOtpChanged});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final int otpLength = 5;

  late final List<TextEditingController> otpControllers;
  late final List<FocusNode> otpFocusNodes;

  @override
  void initState() {
    super.initState();
    otpControllers = List.generate(otpLength, (_) => TextEditingController());
    otpFocusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    otpControllers.forEach((c) => c.dispose());
    otpFocusNodes.forEach((f) => f.dispose());
    super.dispose();
  }

  Color getBorderColor(int index) {
    return otpControllers[index].text.isNotEmpty
        ? ColorManager.secondary2
        : ColorManager.textThird;
  }

  double getBorderWidth(int index) {
    return otpControllers[index].text.isNotEmpty ? 2 : 1.5;
  }

  bool isOtpComplete() {
    return otpControllers.every((c) => c.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(otpLength, (index) {
            return SizedBox(
              width: 64.w,
              child: TextField(
                controller: otpControllers[index],
                focusNode: otpFocusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: TextManager.heading2,
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: getBorderColor(index),
                      width: getBorderWidth(index),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: getBorderColor(index),
                      width: getBorderWidth(index),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {});

                  if (value.isNotEmpty && index < otpLength - 1) {
                    otpFocusNodes[index + 1].requestFocus();
                  } else if (value.isEmpty && index > 0) {
                    otpFocusNodes[index - 1].requestFocus();
                  }

                  // إرسال حالة الاكتمال
                  widget.onOtpChanged?.call(isOtpComplete());

                  // تحقق من اكتمال الكود
                  String code = otpControllers.map((c) => c.text).join();
                  if (code.length == otpLength && widget.onCompleted != null) {
                    widget.onCompleted!(code);
                  }
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}
