import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_color.dart';

class TextBody5 extends StatelessWidget {
  const TextBody5(
    this.text, {
    super.key,
    this.isBold = false,
    this.color = AppColor.black,
  });
  final String text;
  final bool isBold;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 8.sp,
        color: color,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25.sp,
      ),
    );
  }
}
