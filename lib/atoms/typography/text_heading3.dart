import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHeading3 extends StatelessWidget {
  const TextHeading3({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      'Heading 3',
      style: TextStyle(
        fontSize: 48.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
