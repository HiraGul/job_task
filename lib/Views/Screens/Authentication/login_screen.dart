import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_task/Cubits/LoginCubit/login_cubit_cubit.dart';
import 'package:job_task/Utils/app_text_styles.dart';
import 'package:job_task/Utils/routes_names.dart';
import 'package:job_task/Views/Widgets/AutheticationWidgets/custom_button.dart';
import 'package:job_task/Views/Widgets/AutheticationWidgets/custom_text_field.dart';
import 'package:job_task/Views/Widgets/AutheticationWidgets/error_alert.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColorDark,
      body: BlocListener<LoginCubitCubit, LoginCubitState>(
        listener: (context, state) {
          // Exception State
          if (state is LoginCubitLoginException) {
            loginUnsuccessfulAlert(context, state.errorMessage);
          }
          if (state is LoginCubitLoginSuccess) {
            // Login Successful state
            emailController.clear();
            passwordController.clear();
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: const Text('Login Successful'),
                backgroundColor: Theme.of(context).primaryColor,
                behavior: SnackBarBehavior.floating,
              ));

            while (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }

            Navigator.pushReplacementNamed(
                context, AppRouesNames.uploadDocumentScreen);
          }
        },
        child: SizedBox(
          height: 1.sh,
          child: Stack(
            children: [
              Positioned(
                top: -20.sp,
                left: -30.sp,
                child: SvgPicture.asset(
                  'assets/topleft.svg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                bottom: -25.sp,
                left: -10.sp,
                child: SvgPicture.asset(
                  'assets/bottomleft.svg',
                ),
              ),
              Positioned(
                bottom: -20.sp,
                right: -50.sp,
                child: SvgPicture.asset(
                  'assets/bottomright.svg',
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.sp,
                    ),
                    children: [
                      SizedBox(
                        height: 0.13.sh,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Log In",
                          style: AppTextStyles.authSectionTitle(context)
                              .copyWith(fontSize: 30.sp),
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      CustomTextField(
                        textInputType: TextInputType.emailAddress,
                        textFieldName: "Email Address",
                        controller: emailController,
                        hintText: 'Email Address',
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      CustomTextField(
                        textInputType: TextInputType.visiblePassword,
                        textFieldName: "Password",
                        controller: passwordController,
                        hintText: 'Password',
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      CustomButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubitCubit>(context)
                                  .userLoginMethod(emailController.text);
                            }
                          },
                          buttonTitle: "LOGIN"),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyles.textFieldHintSTyle(context)
                              .copyWith(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 60.sp,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Register Here",
                          style: AppTextStyles.authSectionSubTitle(context)
                              .copyWith(
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
