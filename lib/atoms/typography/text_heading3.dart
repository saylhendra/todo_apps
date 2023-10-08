import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHeading3 extends StatelessWidget {
  final String text;
  const TextHeading3(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 48.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
