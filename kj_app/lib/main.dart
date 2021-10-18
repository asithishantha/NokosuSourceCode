import 'package:flutter/material.dart';
import 'package:kjapp/controllers/login_controller.dart';
import 'package:kjapp/login_page.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:kjapp/globalhowtouse1.dart';

// void main() {
//   runApp(MyApp());
// }
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Lottie.asset(
          'assets/74423-photography.json',
          // width: double.infinity,
          // height: double.infinity,
          // fit: BoxFit.contain,
        ),
        nextScreen: globalhowtouse1(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.lightGreen,
        duration: 1550,
      ),
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder, // Add the builder here
    );
    //   return MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(
    //         create: (context) => LoginController(),
    //         child: LoginPage(),
    //       )
    //     ],
    //     child: MaterialApp(
    //       title: 'sdffff Demo',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //       home: LoginPage(),
    //     ),
    //   );
    // }
  }
}
