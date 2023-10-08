import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_color.dart';

class TextHeading6 extends StatelessWidget {
  const TextHeading6(
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
        fontSize: 20.sp,
        fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
        letterSpacing: 0.15.sp,
      ),
    );
  }
}
