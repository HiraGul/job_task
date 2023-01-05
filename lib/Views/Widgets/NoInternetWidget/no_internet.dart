import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_task/Utils/app_colors.dart';
import 'package:job_task/Utils/app_text_styles.dart';
import 'package:job_task/Views/Screens/DashboardScreen/dashboard_screen.dart';

class NoInternetFoundWidget extends StatelessWidget {
  const NoInternetFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: ListView(
          children: [
            SizedBox(
              height: 0.2.sh,
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                  Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
                  color: AppColors.redColor,
                  size: 0.1.sh),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text("No Internet Connection",
                  style: AppTextStyles.instUserNameFontStyle(context)),
            ),
            SizedBox(height: 20.sp),
            Align(
              alignment: Alignment.topCenter,
              child: FittedBox(
                child: Text(
                    "Please check your internet connection and try again",
                    style: AppTextStyles.authSectionSubTitle(context).copyWith(
                        color: AppColors.blackColor, fontSize: 14.sp)),
              ),
            ),
            SizedBox(height: 20.sp),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => DashboardScreen()));
              },
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Refresh Page",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColorDark,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
