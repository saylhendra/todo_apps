import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHeading1 extends StatelessWidget {
  const TextHeading1({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      'Heading 1',
      style: TextStyle(
        fontSize: 96.sp,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5.sp,
      ),
    );
  }
}
