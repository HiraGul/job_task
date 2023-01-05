import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Utils/routes_names.dart';
import 'package:job_task/Views/Screens/DashboardScreen/dashboard_screen.dart';
import 'package:job_task/Views/Widgets/AutheticationWidgets/custom_button.dart';
import 'package:job_task/Views/Widgets/MaterialBanner/banner.dart';
import 'package:job_task/Views/Widgets/UploadDocumentsWidgets/certificate_widget.dart';
import 'package:job_task/Utils/app_colors.dart';
import 'package:job_task/Utils/app_text_styles.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/certificate_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/driving_license_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/passport_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/profile_picture_cubit.dart';

import 'package:job_task/Views/Widgets/UploadDocumentsWidgets/driving_license.dart';
import 'package:job_task/Views/Widgets/UploadDocumentsWidgets/passport_widget.dart';
import 'package:job_task/Views/Widgets/UploadDocumentsWidgets/profile_picture.dart';
import 'package:job_task/Views/Widgets/UploadDocumentsWidgets/slider_widget.dart';

class UploadDocumentScreen extends StatefulWidget {
  const UploadDocumentScreen({Key? key}) : super(key: key);

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      ScaffoldMessenger.of(context)
        ..removeCurrentMaterialBanner()
        ..showMaterialBanner(showMaterialBannerForBinanceCoins(context));
    });

    controller = BottomSheet.createAnimationController(this);

    controller.duration = const Duration(seconds: 1);

    controller.reverseDuration = const Duration(seconds: 1);

    controller.drive(CurveTween(curve: Curves.easeInBack));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: ListView(
        padding: EdgeInsets.all(20.0.sp),
        children: [
          SizedBox(
            height: 30.sp,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Upload Documents",
              style: AppTextStyles.authSectionTitle(context),
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          Row(
            children: [
              SizedBox(
                width: 15.sp,
              ),
              // Document Status Widgets
              BlocBuilder<ProfilePictureCubit, bool>(
                  builder: (context, profileState) {
                return Expanded(
                    child: SliderWidget(
                  color: profileState
                      ? Theme.of(context).primaryColorLight
                      : AppColors.greyColor,
                ));
              }),
              BlocBuilder<DrivingLicenseCubit, bool>(
                  builder: (context, licenseState) {
                return Expanded(
                    child: SliderWidget(
                  color: licenseState
                      ? Theme.of(context).primaryColorLight
                      : AppColors.greyColor,
                ));
              }),
              BlocBuilder<CertificateCubit, bool>(
                  builder: (context, certificateState) {
                return Expanded(
                    child: SliderWidget(
                  color: certificateState
                      ? Theme.of(context).primaryColorLight
                      : AppColors.greyColor,
                ));
              }),
              BlocBuilder<PassportCubit, bool>(
                  builder: (context, passportState) {
                return Expanded(
                    child: SliderWidget(
                  color: passportState
                      ? Theme.of(context).primaryColorLight
                      : AppColors.greyColor,
                ));
              }),
              SizedBox(
                width: 15.sp,
              ),
            ],
          ),
          SizedBox(
            height: 0.07.sh,
          ),
          // profile Picture Document Widget
          ProfilePictureWidget(
            animationController: controller,
          ),
          // Driving License Document Widget
          DrivingLicenseWidget(
            animationController: controller,
          ),
          // Certificate Document Widget
          CertificateWidget(
            animationController: controller,
          ),
          // Passport Document Widget
          PassportWidget(
            animationController: controller,
          ),
          SizedBox(
            height: 0.15.sh,
          ),
          // Button
          BlocBuilder<ProfilePictureCubit, bool>(
            builder: (context, profile) {
              return BlocBuilder<DrivingLicenseCubit, bool>(
                builder: (context, drivingLicense) {
                  return BlocBuilder<CertificateCubit, bool>(
                    builder: (context, certficate) {
                      return BlocBuilder<PassportCubit, bool?>(
                        builder: (context, passport) {
                          return CustomButton(
                              color: profile &&
                                      drivingLicense &&
                                      certficate &&
                                      passport!
                                  ? Theme.of(context).primaryColor
                                  : AppColors.greyColor,
                              onPressed: () {
                                profile &&
                                        drivingLicense &&
                                        certficate &&
                                        passport!
                                    ? Navigator.pushNamed(
                                        context, AppRouesNames.dashboardScreen)
                                    : null;
                              },
                              buttonTitle: "DONE");
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
