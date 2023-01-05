part of 'upload_passport_document_cubit_cubit.dart';

@immutable
abstract class UploadPassportDocumentCubitState {}

class UploadPassportDocumentCubitInitial
    extends UploadPassportDocumentCubitState {}

class UploadPassportDocumentCubitLoading
    extends UploadPassportDocumentCubitState {}

class UploadPassportDocumentLoadedState
    extends UploadPassportDocumentCubitState {
  final File file;
  UploadPassportDocumentLoadedState({required this.file});
}

class UploadPassportImageLoaded extends UploadPassportDocumentCubitState {
  final File file;
  UploadPassportImageLoaded({required this.file});
}

class UploadPassportDocumentException extends UploadPassportDocumentCubitState {
}
