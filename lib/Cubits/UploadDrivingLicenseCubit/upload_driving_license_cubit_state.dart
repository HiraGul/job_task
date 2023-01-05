part of 'upload_driving_license_cubit_cubit.dart';

@immutable
abstract class UploadDrivingLicenseCubitState {}

class UploadDrivingLicenseCubitInitial extends UploadDrivingLicenseCubitState {}

class UploadDrivingLicenseCubitLoading extends UploadDrivingLicenseCubitState {}

class UploadedDrivingLicenseDocumentState
    extends UploadDrivingLicenseCubitState {
  final File file;
  UploadedDrivingLicenseDocumentState({required this.file});
}

class UploadedDrivingLicenseImageState extends UploadDrivingLicenseCubitState {
  final File file;
  UploadedDrivingLicenseImageState({required this.file});
}

class UplodingDrivingLicenseExceptionState
    extends UploadDrivingLicenseCubitState {}
