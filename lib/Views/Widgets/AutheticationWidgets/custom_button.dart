import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_task/Cubits/LoginCubit/login_cubit_cubit.dart';
import 'package:job_task/Utils/app_colors.dart';
import 'package:job_task/Utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Color color;
  final double? height;

  final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
    this.height,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 50.sp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r), color: color),
        child: BlocBuilder<LoginCubitCubit, LoginCubitState>(
          builder: (context, state) {
            if (state is LoginCubitLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              );
            }
            return Align(
              alignment: Alignment.center,
              child: Text(buttonTitle,
                  style: AppTextStyles.authSectionSubTitle(context)
                      .copyWith(fontWeight: FontWeight.w800, fontSize: 18.sp)),
            );
          },
        ),
      ),
    );
  }
}
