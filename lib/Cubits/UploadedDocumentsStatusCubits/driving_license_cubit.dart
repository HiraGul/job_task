import 'package:bloc/bloc.dart';

class DrivingLicenseCubit extends Cubit<bool> {
  DrivingLicenseCubit({required bool initialState}) : super(initialState);

  checkDocStatus({required bool status}) => emit(status);
}
