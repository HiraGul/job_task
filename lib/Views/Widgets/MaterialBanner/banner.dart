import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_task/Utils/app_colors.dart';
import 'package:job_task/Utils/routes_names.dart';

MaterialBanner showMaterialBannerForBinanceCoins(BuildContext context) {
  return MaterialBanner(
      content: const Text('Do you want to know BTC/USDT and ETH/USB Prices?'),
      leading: Icon(
        Icons.price_change_rounded,
        color: AppColors.whiteColor,
      ),
      padding: EdgeInsets.all(15.sp),
      backgroundColor: Theme.of(context).primaryColorLight,
      contentTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.normal,
          color: AppColors.whiteColor,
          fontSize: 16.sp),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouesNames.webSocketScreen);
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: Text(
            'Yes',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor,
                fontSize: 16.sp),
          ),
        ),
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: Text(
            'No',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor,
                fontSize: 16.sp),
          ),
        ),
      ]);
}
