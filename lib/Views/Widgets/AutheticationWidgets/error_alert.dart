import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Utils/app_text_styles.dart';

import 'package:job_task/Views/Screens/Authentication/login_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

loginUnsuccessfulAlert(ctx, String error) {
  Alert(
    closeIcon: Container(),
    useRootNavigator: true,
    onWillPopActive: true,
    context: ctx,
    type: AlertType.error,
    title: "ERROR",
    style: AlertStyle(
        descStyle: AppTextStyles.authSectionSubTitle(ctx),
        backgroundColor: Theme.of(ctx).primaryColorDark,
        titleStyle: AppTextStyles.authSectionTitle(ctx)),
    desc: error.toString(),
    buttons: [
      DialogButton(
        color: Theme.of(ctx).primaryColorLight,
        child: Text("OKAY",
            style: AppTextStyles.authSectionSubTitle(ctx)
                .copyWith(fontWeight: FontWeight.w800, fontSize: 18.sp)),
        onPressed: () => Navigator.pushReplacement(
            ctx, MaterialPageRoute(builder: (ctx) => const LoginScreen())),
        width: 120,
      )
    ],
  ).show();
}
