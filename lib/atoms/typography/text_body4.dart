import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_color.dart';

class TextBody4 extends StatelessWidget {
  const TextBody4(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.isBold = false,
    this.color = AppColor.primary,
  });
  final String text;
  final TextAlign? textAlign;
  final bool isBold;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      // maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: 10.sp,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
        letterSpacing: 0.25.sp,
      ),
    );
  }
}
