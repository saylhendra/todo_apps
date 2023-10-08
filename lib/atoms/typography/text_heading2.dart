import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHeading2 extends StatelessWidget {
  final String title;
  const TextHeading2(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 60.sp,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5.sp,
      ),
    );
  }
}
