part of 'upload_certificate_document_cubit_cubit.dart';

@immutable
abstract class UploadCertificateDocumentCubitState {}

class UploadCertificateDocumentCubitInitial
    extends UploadCertificateDocumentCubitState {}

class UploadingCertificate extends UploadCertificateDocumentCubitState {}

class UploadedCertificateDocument extends UploadCertificateDocumentCubitState {
  final File file;
  UploadedCertificateDocument({required this.file});
}

class UploadedCertificateImage extends UploadCertificateDocumentCubitState {
  final File file;
  UploadedCertificateImage({required this.file});
}

class UploadedCertificateException extends UploadCertificateDocumentCubitState {
}
