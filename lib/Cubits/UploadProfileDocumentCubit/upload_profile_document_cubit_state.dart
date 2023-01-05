part of 'upload_profile_document_cubit_cubit.dart';

@immutable
abstract class UploadProfileDocumentCubitState {}

class UploadProfileDocumentCubitInitial
    extends UploadProfileDocumentCubitState {}

class UploadProfileDocumentLoadingState
    extends UploadProfileDocumentCubitState {}

class UploadProfileDocumentLoadedState extends UploadProfileDocumentCubitState {
  final File file;
  UploadProfileDocumentLoadedState({required this.file});
}

class UploadProfileImageLoadedState extends UploadProfileDocumentCubitState {
  final File file;
  UploadProfileImageLoadedState({required this.file});
}

class UploadProfileDocumentException extends UploadProfileDocumentCubitState {}
