import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_task/Cubits/UploadCertificateDocumentCubit/upload_certificate_document_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadDrivingLicenseCubit/upload_driving_license_cubit_cubit.dart';

import 'package:job_task/Cubits/UploadPassportDocumentCubit/upload_passport_document_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadProfileDocumentCubit/upload_profile_document_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/certificate_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/driving_license_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/passport_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/profile_picture_cubit.dart';
import 'package:job_task/Utils/app_colors.dart';

bottomSheetForImageFileSelection({
  required BuildContext buildContext,
  required String? docName,
  required AnimationController controller,
}) async {
  showModalBottomSheet(
      useRootNavigator: true,
      transitionAnimationController: controller,
      context: buildContext,
      backgroundColor: Theme.of(buildContext).primaryColorLight,
      builder: (context) {
        return SizedBox(
          height: 160.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.camera_alt, color: Colors.white),
                  title: Text(
                    'Camera',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    if (docName == 'Profile Picture') {
                      context
                          .read<UploadProfileDocumentCubitCubit>()
                          .selectProfileImageCamera()
                          .then((value) {
                        value == true
                            ? BlocProvider.of<ProfilePictureCubit>(context)
                                .checkDocStatus(status: true)
                            : null;
                        Navigator.pop(context);
                      });
                    } else if (docName == 'Driving License') {
                      context
                          .read<UploadDrivingLicenseCubitCubit>()
                          .selectDrivingImageCamera()
                          .then((value) {
                        value
                            ? context
                                .read<DrivingLicenseCubit>()
                                .checkDocStatus(status: true)
                            : null;
                        Navigator.pop(context);
                      });
                    } else if (docName == 'Certificate') {
                      context
                          .read<UploadCertificateDocumentCubitCubit>()
                          .selectCerificateImageCamera()
                          .then((value) {
                        value
                            ? context
                                .read<CertificateCubit>()
                                .checkDocStatus(status: true)
                            : null;
                        Navigator.pop(context);
                      });
                    } else if (docName == 'Passport') {
                      context
                          .read<UploadPassportDocumentCubitCubit>()
                          .selectPassportImageCamera()
                          .then((value) {
                        value
                            ? context
                                .read<PassportCubit>()
                                .checkDocStatus(status: true)
                            : null;
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
              ),
              Divider(
                color: AppColors.whiteColor,
                indent: 20.w,
                endIndent: 20.w,
                thickness: 5.sp,
              ),
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.file_copy_outlined,
                      color: AppColors.whiteColor),
                  title: Text(
                    'Files',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    if (docName == 'Profile Picture') {
                      context
                          .read<UploadProfileDocumentCubitCubit>()
                          .selectProfileImageFiles()
                          .then((value) {
                        value == true
                            ? BlocProvider.of<ProfilePictureCubit>(context)
                                .checkDocStatus(status: true)
                            : null;
                        Navigator.pop(context);
                      });
                    } else if (docName == 'Driving License') {
                      context
                          .read<UploadDrivingLicenseCubitCubit>()
                          .selectDrivingImageFiles()
                          .then((value) {
                        value
                            ? context
                                .read<DrivingLicenseCubit>()
                                .checkDocStatus(status: true)
                            : null;
                        Navigator.pop(context);
                      });
                      ;
                    } else if (docName == 'Certificate') {
                      context
                          .read<UploadCertificateDocumentCubitCubit>()
                          .selectCerificateFiles()
                          .then((value) {
                        value
                            ? context
                                .read<CertificateCubit>()
                                .checkDocStatus(status: true)
                            : null;
                        Navigator.pop(context);
                      });
                    } else if (docName == 'Passport') {
                      context
                          .read<UploadPassportDocumentCubitCubit>()
                          .selectPassportFiles()
                          .then((value) {
                        value
                            ? context
                                .read<PassportCubit>()
                                .checkDocStatus(status: true)
                            : null;
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        );
      });
}
