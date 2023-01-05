import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Cubits/WebSocketCubit/web_socket_binance_api_cubit_cubit.dart';
import 'package:job_task/Utils/app_colors.dart';
import 'package:job_task/Views/Widgets/AutheticationWidgets/custom_button.dart';
import 'package:job_task/Views/Widgets/WebSocketWidgets/web_socket_coin_widget.dart';

class WebSocketCryptoCoins extends StatefulWidget {
  const WebSocketCryptoCoins({Key? key}) : super(key: key);

  @override
  State<WebSocketCryptoCoins> createState() => _WebSocketCryptoCoinsState();
}

class _WebSocketCryptoCoinsState extends State<WebSocketCryptoCoins> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WebSocketBinanceApiCubitCubit>(context).streamListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: BlocBuilder<WebSocketBinanceApiCubitCubit,
          WebSocketBinanceApiCubitState>(
        builder: (context, state) {
          if (state is WebSocketBinanceApiCubitLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.whiteColor,
              ),
            );
          }
          if (state is WebSocketBinanceApiCubitLoaded) {
            return SizedBox(
              height: 1.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                      child: CoinWidget(
                    coinName: "BTC/USDT Price",
                    coinValue: state.coins.bitCoin.toString(),
                    cryptoFontIconData: CryptoFontIcons.BTC,
                  )),
                  Expanded(
                      child: CoinWidget(
                    coinName: "ETH/USDT Price",
                    coinValue: state.coins.etherium.toString(),
                    cryptoFontIconData: CryptoFontIcons.ETH,
                  )),
                  Expanded(
                      child: CoinWidget(
                    coinName: "USDT/USDT Price",
                    coinValue: state.coins.tether.toString(),
                    cryptoFontIconData: CryptoFontIcons.TRIG,
                  )),
                  const Spacer(),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 20.sp),
                    child: CustomButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      height: 40.sp,
                      buttonTitle: 'Go Back',
                      color: Theme.of(context).primaryColor,
                    ),
                  )),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
