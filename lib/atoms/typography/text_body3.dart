import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_color.dart';

class TextBody3 extends StatelessWidget {
  const TextBody3(
    this.text, {
    super.key,
    this.isBold = false,
    this.color = AppColor.primary,
  });
  final String text;
  final bool isBold;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        color: color,
        fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
        letterSpacing: 0.25.sp,
      ),
    );
  }
}
