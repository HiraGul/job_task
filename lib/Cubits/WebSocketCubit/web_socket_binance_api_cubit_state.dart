part of 'web_socket_binance_api_cubit_cubit.dart';

@immutable
abstract class WebSocketBinanceApiCubitState {}

class WebSocketBinanceApiCubitInitial extends WebSocketBinanceApiCubitState {}

class WebSocketBinanceApiCubitLoading extends WebSocketBinanceApiCubitState {}

class WebSocketBinanceApiCubitLoaded extends WebSocketBinanceApiCubitState {
  Coins coins;
  WebSocketBinanceApiCubitLoaded({required this.coins});
}

class WebSocketBinanceApiCubitException extends WebSocketBinanceApiCubitState {}
