import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:job_task/Data/Model/Coins/coins.dart';
import 'package:meta/meta.dart';
import 'package:web_socket_channel/io.dart';

part 'web_socket_binance_api_cubit_state.dart';

class WebSocketBinanceApiCubitCubit
    extends Cubit<WebSocketBinanceApiCubitState> {
  WebSocketBinanceApiCubitCubit() : super(WebSocketBinanceApiCubitInitial());

  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@trade');

  streamListener() {
    try {
      Future.delayed(Duration.zero, () {
        emit(WebSocketBinanceApiCubitLoading());
      });

      channel.stream.listen((message) {
        Map coinsData = jsonDecode(message);

        Coins coins = Coins(
            bitCoin: coinsData['p'],
            etherium: coinsData['p'],
            tether: coinsData['p']);
        emit(WebSocketBinanceApiCubitLoaded(coins: coins));
      });
    } catch (e) {
      emit(WebSocketBinanceApiCubitException());
    }
  }

  void dispose() {
    channel.stream.asBroadcastStream();
    channel.sink.close();
  }
}
