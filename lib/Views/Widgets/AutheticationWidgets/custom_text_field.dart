import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Utils/app_colors.dart';
import 'package:job_task/Utils/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String textFieldName;
  final TextInputType textInputType;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.textInputType,
    required this.textFieldName,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      cursorColor: Theme.of(context).primaryColorDark,
      style: AppTextStyles.textFieldHintSTyle(context)
          .copyWith(color: AppColors.blackColor),
      decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 12.sp),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0.r),
            borderSide: BorderSide(color: AppColors.whiteColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0.r),
            borderSide: BorderSide(color: AppColors.whiteColor, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
            borderSide: BorderSide(color: AppColors.whiteColor, width: 1),
          ),
          contentPadding: EdgeInsets.only(
              left: 15.0.sp, top: 15.0.sp, bottom: 15.sp, right: 5.sp),
          fillColor: AppColors.whiteColor,
          filled: true,
          hintStyle: AppTextStyles.textFieldHintSTyle(context),
          hintText: widget.hintText),
      onFieldSubmitted: (value) => {
        if (widget.textFieldName == 'Email Address')
          {
            _isValid = EmailValidator.validate(value),
            if (!_isValid)
              {
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: const Text('Please enter a valid email'),
                    backgroundColor: AppColors.redColor,
                    behavior: SnackBarBehavior.floating,
                  ))
              }
          },
      },
      validator: (value) => value!.isEmpty
          ? '${widget.textFieldName} required'
          : value.length < 6
              ? '${widget.textFieldName} cannot be less than 6 characters '
              : widget.textFieldName == 'Password'
                  ? value.length < 6
                      ? '${widget.textFieldName} Password must be atleast 6 characters long'
                      : null
                  : null,
    );
  }
}
