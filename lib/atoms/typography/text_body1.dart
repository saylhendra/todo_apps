import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_color.dart';

class TextBody1 extends StatelessWidget {
  const TextBody1(
    this.text, {
    super.key,
    this.isBold = false,
    this.color = AppColor.primary,
    this.fontSize,
  });
  final String text;
  final bool isBold;
  final Color color;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16.sp,
        color: color,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
        letterSpacing: 0.5.sp,
      ),
    );
  }
}
