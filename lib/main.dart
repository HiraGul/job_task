import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Utils/main_class_providers.dart';
import 'package:job_task/Utils/theme_data.dart';
import 'package:job_task/Views/Screens/Authentication/login_screen.dart';
import 'package:job_task/Views/Screens/DashboardScreen/dashboard_screen.dart';
import 'package:job_task/Views/Screens/UploadDocumentScreen/user_document_upload_screen.dart';

import 'Utils/routes_names.dart';
import 'Views/Screens/WebSocketScreen/binance_api_web_socket.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext buildContext) => MultiBlocProvider(
        providers: mainCubitProvidersList,
        child: MaterialApp(
          title: 'ProductBox Flutter Exercise',
          theme: MyThemeData.themeData,
          routes: {
            AppRouesNames.loginScreen: (context) => const LoginScreen(),
            AppRouesNames.uploadDocumentScreen: (context) =>
                const UploadDocumentScreen(),
            AppRouesNames.dashboardScreen: (context) => const DashboardScreen(),
            AppRouesNames.webSocketScreen: (context) =>
                const WebSocketCryptoCoins(),
          },
          debugShowCheckedModeBanner: false,
          home: ScreenUtilInit(
            designSize: const Size(360, 690),
            useInheritedMediaQuery: false,
            builder: (context, child) => const UploadDocumentScreen(),
          ),
        ),
      );
}
