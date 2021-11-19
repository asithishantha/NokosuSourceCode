import 'package:flutter/material.dart';
import 'package:kjapp/controllers/login_controller.dart';
import 'package:kjapp/login_page.dart';
import 'package:provider/provider.dart';

class BeforeLoginPage extends StatefulWidget {
  const BeforeLoginPage({Key? key}) : super(key: key);

  @override
  _BeforeLoginPageState createState() => _BeforeLoginPageState();
}

class _BeforeLoginPageState extends State {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: LoginPage(),

          // child: MainPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: LoginPage(),
        // locale: DevicePreview.locale(context), // Add the locale here
        // builder: DevicePreview.appBuilder, // Add the builder here
      ),
    );
  }
}
