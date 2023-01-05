import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePictureCubit extends Cubit<bool> {
  ProfilePictureCubit({required bool initialState}) : super(initialState);

  checkDocStatus({required bool status}) => emit(status);
}
