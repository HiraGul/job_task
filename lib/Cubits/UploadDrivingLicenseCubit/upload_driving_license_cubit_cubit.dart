import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_task/Data/Repositories/ImageAndFilePickerRepo/image_and_filepicker_repo.dart';
import 'package:meta/meta.dart';

part 'upload_driving_license_cubit_state.dart';

class UploadDrivingLicenseCubitCubit
    extends Cubit<UploadDrivingLicenseCubitState> {
  UploadDrivingLicenseCubitCubit() : super(UploadDrivingLicenseCubitInitial());
  Future<bool> selectDrivingImageCamera() async {
    PickedFile? image;

    image = await ImageAndFilePickerRepository.pickImagefromCamera();

    if (image!.path.isNotEmpty) {
      emit(UploadedDrivingLicenseImageState(file: File(image.path.toString())));
      return true;
    } else {
      emit(UplodingDrivingLicenseExceptionState());
      return false;
    }
  }

  Future<bool> selectDrivingImageFiles() async {
    FilePickerResult? result = await ImageAndFilePickerRepository.pickFile();

    if (result != null) {
      File file = File(result.files.single.path!);

      if (file.uri.toString().contains('pdf')) {
        emit(UploadedDrivingLicenseDocumentState(file: file));
      } else {
        emit(UploadedDrivingLicenseImageState(file: file));
      }
      return true;
    } else {
      emit(UplodingDrivingLicenseExceptionState());
      return false;
    }
  }
}
