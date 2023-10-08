import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextSubtitle3 extends StatelessWidget {
  const TextSubtitle3(
    this.text, {
    super.key,
    this.isBold = false,
    this.fontSize,
  });
  final String text;
  final bool isBold;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 10.sp,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
        letterSpacing: isBold ? 0.25.sp : 0.1.sp,
      ),
    );
  }
}
