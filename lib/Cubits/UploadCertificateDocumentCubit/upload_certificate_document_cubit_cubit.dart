import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_task/Data/Repositories/ImageAndFilePickerRepo/image_and_filepicker_repo.dart';
import 'package:meta/meta.dart';

part 'upload_certificate_document_cubit_state.dart';

class UploadCertificateDocumentCubitCubit
    extends Cubit<UploadCertificateDocumentCubitState> {
  UploadCertificateDocumentCubitCubit()
      : super(UploadCertificateDocumentCubitInitial());
  Future<bool> selectCerificateImageCamera() async {
    PickedFile? image;

    image = await ImageAndFilePickerRepository.pickImagefromCamera();

    if (image!.path.isNotEmpty) {
      emit(UploadedCertificateImage(file: File(image.path.toString())));
      return true;
    } else {
      emit(UploadedCertificateException());
      return false;
    }
  }

  Future<bool> selectCerificateFiles() async {
    FilePickerResult? result = await ImageAndFilePickerRepository.pickFile();

    if (result != null) {
      File file = File(result.files.single.path!);

      if (file.uri.toString().contains('pdf')) {
        emit(UploadedCertificateDocument(file: file));
      } else {
        emit(UploadedCertificateImage(file: file));
      }
      return true;
    } else {
      emit(UploadedCertificateException());
      return false;
    }
  }
}
