import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextSubtitle2 extends StatelessWidget {
  const TextSubtitle2(
    this.text, {
    super.key,
    this.isBold = false,
  });
  final String text;
  final bool isBold;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
        letterSpacing: 0.1.sp,
      ),
    );
  }
}
