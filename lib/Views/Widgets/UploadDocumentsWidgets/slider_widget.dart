import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderWidget extends StatelessWidget {
  final Color color;
  const SliderWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.sp),
      height: 8.sp,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20.0.r)),
    );
  }
}
