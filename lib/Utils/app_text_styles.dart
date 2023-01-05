// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_task/Utils/app_colors.dart';

class AppTextStyles {
  static TextStyle authSectionTitle(BuildContext context) {
    return GoogleFonts.poppins(
        fontSize: 20.0.sp,
        color: AppColors.whiteColor,
        letterSpacing: 2.sp,
        fontWeight: FontWeight.w900,
        wordSpacing: 2);
  }

  static TextStyle authSectionSubTitle(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 22.0.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textFieldHintSTyle(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 12.0,
      color: AppColors.greyColor,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle instUserNameFontStyle(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 16.0,
      color: Theme.of(context).primaryColorDark,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle errorTextStyle(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 14.0,
      color: AppColors.redColor,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }
}
