import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHeading4 extends StatelessWidget {
  const TextHeading4({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      'Heading 4',
      style: TextStyle(
        fontSize: 34.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25.sp,
      ),
    );
  }
}
