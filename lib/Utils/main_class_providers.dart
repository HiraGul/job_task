import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_task/Cubits/InstagramStoriesCubit/instagram_stories_cubit_cubit.dart';
import 'package:job_task/Cubits/InstaramPostsCubit/instagram_posts_cubit.dart';
import 'package:job_task/Cubits/LoginCubit/login_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadCertificateDocumentCubit/upload_certificate_document_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadDrivingLicenseCubit/upload_driving_license_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadPassportDocumentCubit/upload_passport_document_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadProfileDocumentCubit/upload_profile_document_cubit_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/certificate_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/driving_license_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/passport_cubit.dart';
import 'package:job_task/Cubits/UploadedDocumentsStatusCubits/profile_picture_cubit.dart';
import 'package:job_task/Cubits/WebSocketCubit/web_socket_binance_api_cubit_cubit.dart';

final List<BlocProvider> mainCubitProvidersList = [
  BlocProvider<LoginCubitCubit>(
    create: (context) => LoginCubitCubit(),
  ),
  BlocProvider<ProfilePictureCubit>(
      create: (context) => ProfilePictureCubit(initialState: false)),
  BlocProvider<DrivingLicenseCubit>(
      create: (context) => DrivingLicenseCubit(initialState: false)),
  BlocProvider<PassportCubit>(
      create: (context) => PassportCubit(initialState: false)),
  BlocProvider<CertificateCubit>(
      create: (context) => CertificateCubit(initialState: false)),
  BlocProvider<UploadProfileDocumentCubitCubit>(
    create: (context) => UploadProfileDocumentCubitCubit(),
  ),
  BlocProvider<UploadDrivingLicenseCubitCubit>(
    create: (context) => UploadDrivingLicenseCubitCubit(),
  ),
  BlocProvider<UploadPassportDocumentCubitCubit>(
    create: (context) => UploadPassportDocumentCubitCubit(),
  ),
  BlocProvider<UploadCertificateDocumentCubitCubit>(
    create: (context) => UploadCertificateDocumentCubitCubit(),
  ),
  BlocProvider<InstagramStoriesCubitCubit>(
    create: (context) => InstagramStoriesCubitCubit(),
  ),
  BlocProvider<InstagramPostsCubit>(
    create: (context) => InstagramPostsCubit(),
  ),
  BlocProvider<WebSocketBinanceApiCubitCubit>(
    create: (context) => WebSocketBinanceApiCubitCubit(),
  ),
];
