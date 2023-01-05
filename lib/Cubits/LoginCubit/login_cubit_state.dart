part of 'login_cubit_cubit.dart';

@immutable
abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}

class LoginCubitLoadingState extends LoginCubitState {}

class LoginCubitLoginSuccess extends LoginCubitState {}

class LoginCubitLoginException extends LoginCubitState {
  final String errorMessage;
  LoginCubitLoginException({required this.errorMessage});
}
