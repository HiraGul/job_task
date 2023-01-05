import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_task/Data/Repositories/ImageAndFilePickerRepo/image_and_filepicker_repo.dart';
import 'package:meta/meta.dart';

part 'upload_passport_document_cubit_state.dart';

class UploadPassportDocumentCubitCubit
    extends Cubit<UploadPassportDocumentCubitState> {
  UploadPassportDocumentCubitCubit()
      : super(UploadPassportDocumentCubitInitial());
  Future<bool> selectPassportImageCamera() async {
    PickedFile? image;

    image = await ImageAndFilePickerRepository.pickImagefromCamera();

    if (image!.path.isNotEmpty) {
      emit(UploadPassportImageLoaded(file: File(image.path.toString())));
      return true;
    } else {
      emit(UploadPassportDocumentException());
      return false;
    }
  }

  Future<bool> selectPassportFiles() async {
    FilePickerResult? result = await ImageAndFilePickerRepository.pickFile();

    if (result != null) {
      File file = File(result.files.single.path!);

      if (file.uri.toString().contains('pdf')) {
        emit(UploadPassportDocumentLoadedState(file: file));
      } else {
        emit(UploadPassportImageLoaded(file: file));
      }
      return true;
    } else {
      emit(UploadPassportDocumentException());
      return false;
    }
  }
}
