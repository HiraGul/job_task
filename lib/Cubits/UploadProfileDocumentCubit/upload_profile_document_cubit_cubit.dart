import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_task/Data/Repositories/ImageAndFilePickerRepo/image_and_filepicker_repo.dart';
import 'package:meta/meta.dart';

part 'upload_profile_document_cubit_state.dart';

class UploadProfileDocumentCubitCubit
    extends Cubit<UploadProfileDocumentCubitState> {
  UploadProfileDocumentCubitCubit()
      : super(UploadProfileDocumentCubitInitial());
  Future<bool> selectProfileImageCamera() async {
    PickedFile? image;

    image = await ImageAndFilePickerRepository.pickImagefromCamera();

    if (image!.path.isNotEmpty) {
      emit(UploadProfileImageLoadedState(file: File(image.path.toString())));
      return true;
    } else {
      emit(UploadProfileDocumentException());
      return false;
    }
  }

  Future<bool> selectProfileImageFiles() async {
    FilePickerResult? result = await ImageAndFilePickerRepository.pickFile();

    if (result != null) {
      File file = File(result.files.single.path!);

      if (file.uri.toString().contains('pdf')) {
        print('Pdf');
        print(file.uri.toString());

        emit(UploadProfileDocumentLoadedState(file: file));
      } else {
        emit(UploadProfileImageLoadedState(file: file));
      }
      return true;
    } else {
      emit(UploadProfileDocumentException());
      return false;
    }
  }
}
