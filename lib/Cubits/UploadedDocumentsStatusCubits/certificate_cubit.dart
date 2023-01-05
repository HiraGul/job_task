import 'package:bloc/bloc.dart';

class CertificateCubit extends Cubit<bool> {
  CertificateCubit({required bool initialState}) : super(initialState);

  checkDocStatus({required bool status}) => emit(status);
}
