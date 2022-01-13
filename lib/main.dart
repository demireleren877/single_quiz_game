import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/constants/color_constants.dart';
import 'package:game/core/constants/hive_constants.dart';
import './feature/gameplay/game_screen.dart';
import './feature/home/home_screen.dart';
import './feature/results/result_screen.dart';
import './feature/splash/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/constants/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.transparent));
  await Firebase.initializeApp();
  var appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.openBox(HiveConstants.boxName);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 798),
      builder: () => MaterialApp(
        theme: themeData(context),
        debugShowCheckedModeBanner: false,
        title: 'Quiz Game',
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          "/homeScreen": (context) => const HomeScreen(),
          "/gameScreen": (context) => const GameScreen(),
          "resultScreen": (context) => const ResultScreen(),
        },
      ),
    );
  }
}
