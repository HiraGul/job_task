import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Cubits/UploadDrivingLicenseCubit/upload_driving_license_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadPassportDocumentCubit/upload_passport_document_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadProfileDocumentCubit/upload_profile_document_cubit_cubit.dart';
import 'package:job_task/Utils/app_colors.dart';
import 'package:job_task/Utils/app_text_styles.dart';
import 'package:job_task/Views/Widgets/UploadDocumentsWidgets/bottom_sheet_image_filte.dart';
import 'package:job_task/Views/Widgets/UploadDocumentsWidgets/image_view.dart';
import 'package:job_task/Views/Widgets/UploadDocumentsWidgets/pdf_view.dart';

class DrivingLicenseWidget extends StatelessWidget {
  final AnimationController animationController;
  const DrivingLicenseWidget({
    required this.animationController,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => bottomSheetForImageFileSelection(
          buildContext: context,
          docName: 'Driving License',
          controller: animationController)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.sp),
        height: 50.sp,
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: AppColors.whiteColor),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Driving License',
                style: AppTextStyles.authSectionSubTitle(context).copyWith(
                    color: AppColors.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: BlocBuilder<UploadDrivingLicenseCubitCubit,
                    UploadDrivingLicenseCubitState>(
                  builder: (context, state) {
                    print("State is $state");
                    if (state is UploadedDrivingLicenseImageState) {
                      return GestureDetector(
                        onTap: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return ImageView(imageUrl: state.file);
                          }));
                        },
                        child: Container(
                          height: 45.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            image: DecorationImage(
                                image: FileImage(state.file),
                                alignment: Alignment.centerRight,
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    } else if (state is UploadedDrivingLicenseDocumentState) {
                      return Container(
                        height: 45.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return PdfView(pdfUrl: state.file.path);
                            }));
                          },
                          child: Stack(
                            children: [
                              PDFView(
                                filePath: state.file.path,
                                enableSwipe: false,
                                swipeHorizontal: false,
                                autoSpacing: false,
                                pageFling: false,
                                onError: (error) {},
                                onPageError: (page, error) {},
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 45.h,
                                width: 60.sw,
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
