import 'package:flutter_bloc/flutter_bloc.dart';

class PassportCubit extends Cubit<bool> {
  PassportCubit({required bool initialState}) : super(initialState);

  checkDocStatus({required bool status}) => emit(status);
}
