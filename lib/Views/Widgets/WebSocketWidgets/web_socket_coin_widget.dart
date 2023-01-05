import 'package:crypto_font_icons/crypto_font_icon_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_task/Utils/app_colors.dart';

class CoinWidget extends StatelessWidget {
  final String coinName;
  final String coinValue;
  final CryptoFontIconData cryptoFontIconData;
  CoinWidget(
      {required this.coinName,
      required this.coinValue,
      required this.cryptoFontIconData,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final convertedValue = double.parse(coinValue);
    var coinValueAfterRound = double.parse(convertedValue.toStringAsFixed(2));
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
      height: 50.sp,
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: AppColors.whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              cryptoFontIconData,
              color: Theme.of(context).primaryColorDark,
              size: 18.sp,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              coinName,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                  fontSize: 16.sp),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              coinValueAfterRound.toString(),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                  fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
