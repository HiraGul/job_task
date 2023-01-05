import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_task/Data/Repositories/AuthenticationRepository/login_repository.dart';
import 'package:job_task/DataController/UserDataController/user_data_controller.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());
  userLoginMethod(String email) async {
    try {
      emit(LoginCubitLoadingState());

      final apiStatusCode = await UserLoginRepository.userLogin();

      if (apiStatusCode == 200) {
        for (int i = 0; i < UserDataController.userModelClass.length; i++) {
          if (email == UserDataController.userModelClass[i].email) {
            debugPrint("Email $email");
            debugPrint("Email ${UserDataController.userModelClass[i].email}");
            emit(LoginCubitLoginSuccess());
            break;
          } else {
            emit(LoginCubitLoginException(errorMessage: 'User Not Found'));
          }
        }
      } else if (apiStatusCode == 400) {
        emit(LoginCubitLoginException(errorMessage: 'Invalid Credentials'));
      } else if (apiStatusCode == 500) {
        emit(LoginCubitLoginException(errorMessage: 'Internal Server error.'));
      } else if (apiStatusCode == 501) {
        emit(LoginCubitLoginException(
            errorMessage:
                'Your Internet connection is unstable. Please try again.'));
      } else {
        emit(LoginCubitLoginException(
            errorMessage:
                'While Faculty logging in an error is occurred. Please Try again.'));
      }
    } on Exception {
      emit(LoginCubitLoginException(
          errorMessage:
              'While Faculty logging in an error is occurred. Please Try again.'));
    }
  }
}
