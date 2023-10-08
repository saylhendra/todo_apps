import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHeading5 extends StatelessWidget {
  const TextHeading5({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      'Heading 5',
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
