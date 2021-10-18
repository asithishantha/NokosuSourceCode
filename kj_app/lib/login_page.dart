import 'dart:typed_data';
import 'package:kjapp/HomePage.dart';
import 'package:kjapp/gallery.dart';
import 'package:kjapp/galleryMain.dart';
import 'package:kjapp/profile.dart';
import 'package:kjapp/userprofile.dart';

import 'gallery.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kjapp/controllers/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

StreamController<int> streamController = StreamController<int>();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

  loggedInUI(model) {}
  
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey _NavKey = GlobalKey();
  

  // var PagesAll = [HomePage()];

  //   var myindex = 0;
  var PagesAll = [
    EditPage(),
    UserProfile(),
  ];

  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login App"),
      //   centerTitle: true,
      //   backgroundColor: Colors.redAccent,
      // ),

      backgroundColor: Colors.white,
      body: loginUI(),
    );
  }

  // creating a function loginUI

  loginUI() {
    // loggedINUI
    // loginControllers

    return Consumer<LoginController>(builder: (context, model, child) {
      // if we are already logged in

      if (model.userDetails != null) {
        // return MaterialApp(
        //   theme: ThemeData(
        //     primarySwatch: Colors.blue,
        //   ),
        //   home: galleryMain(),
        // );

        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.camera),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            key: _NavKey,
            items: [
              Icon((myindex == 0) ? Icons.home_outlined : Icons.home),
              // Icon((myindex == 1) ? Icons.message : Icons.message_outlined),
              // Icon((myindex == 2) ? Icons.favorite_border : Icons.favorite),
              Icon((myindex == 1)
                  ? Icons.perm_identity
                  : Icons.perm_contact_cal_rounded),
            ],
            buttonBackgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                myindex = index;
              });
            },
            animationCurve: Curves.fastLinearToSlowEaseIn,
            color: Colors.green,
          ),
          backgroundColor: Colors.amber,
          body: SafeArea(
            child: PagesAll[myindex],

            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: <Widget>[
            //     SizedBox(
            //       height: 40,
            //     ),
            //     Padding(
            //       padding: EdgeInsets.fromLTRB(00, 0, 0, 20),
            //       child: Align(
            //         alignment: Alignment.topCenter,
            //         child: Container(
            //           // padding: EdgeInsets.symmetric(
            //           //   horizontal: 20,
            //           //   vertical: 30,
            //           // ),
            //           child: loggedInUI(model),
            //         ),
            //       ),
            //     ),
            //     // Padding(
            //     //   padding: EdgeInsets.fromLTRB(00, 0, 0, 0),
            //     //   child: PagesAll[myindex],
            //     // ),
            //     // Expanded(
            //     //   // padding: EdgeInsets.fromLTRB(00, 0, 0, 40),

            //     //   child: Container(
            //     //     decoration: BoxDecoration(
            //     //       color: Colors.green,
            //     //       borderRadius: BorderRadius.only(
            //     //         topLeft: Radius.circular(30),
            //     //         topRight: Radius.circular(30),
            //     //       ),
            //     //     ),
            //     //     child: MediaGrid(),
            //     //   ),
            //     // ),
            //     // Padding(
            //     //   padding: EdgeInsets.fromLTRB(00, 0, 0, 0),
            //     //   // child: PagesAll[myindex],
            //     // ),
            //   ],
            // ),
          ),
        );

        // child: loggedInUI(model),

        // home: MyHomePage(
        //   title: 'abcd',
        // ),

      } else {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(00, 50, 0, 40),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 0.0, top: 50.0, right: 0.0, bottom: 0.0),
                        width: 200,
                        height: 200,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/google_tra.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(00, 0, 0, 0),
                        child: SizedBox(
                          width: 250.0,
                          height: 50,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 32.0,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                // FadeAnimatedText('do IT!'),
                                // FadeAnimatedText('do it RIGHT!!'),
                                // FadeAnimatedText('do it RIGHT NOW!!!'),
                                // RotateAnimatedText('Hello!'),
                                RotateAnimatedText(' Hello！'),
                                RotateAnimatedText('こんにちは！'),
                                RotateAnimatedText('여보! '),
                                RotateAnimatedText('你好！'),
                              ],
                              // onTap: () {
                              //   print("Tap Event");
                              // },
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(00, 0, 0, 0),
                        child: SizedBox(
                          width: 250.0,
                          height: 20,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12.0,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                // FadeAnimatedText('do IT!'),
                                // FadeAnimatedText('do it RIGHT!!'),
                                // FadeAnimatedText('do it RIGHT NOW!!!'),
                                // RotateAnimatedText('Hello!'),
                                RotateAnimatedText(
                                    'Welcome to KJ Application.'),
                                RotateAnimatedText('KJアプリケーションへようこそ。'),
                                RotateAnimatedText('KJ 앱에 오신 것을 환영합니다. '),
                                RotateAnimatedText('欢迎使用 KJ 应用程序。'),
                              ],
                              // onTap: () {
                              //   print("Tap Event");
                              // },
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(00, 50, 00, 20),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
                        child: loginControllers(context),
                      ), //Container
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 0.0, top: 60.0, right: 0.0, bottom: 0.0),
                        width: 70,
                        height: 70,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/globaldesign.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                        // child: Image.asset(
                        //   'assets/google_tra.png',
                        //   fit: BoxFit.contain,
                        // ),
                      ), //Container
                    ),
                  ]),
            ),
          ),
        );
      }
    });
  }

  loggedInUI(LoginController model) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,

      // our ui will have 3 children, name, email, photo , logout button

      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50,
        ),

        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),

        // logout
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: () {
              Provider.of<LoginController>(context, listen: false).logout();
            })
      ],
    );
  }

  // Widget _textLiquidFillAnimation() {
  //   return SizedBox(
  //     child: Center(
  //       child: TextLiquidFill(
  //         text: 'Flutter Devs',
  //         waveDuration: Duration(seconds: 5),
  //         waveColor: Colors.blue,
  //         boxBackgroundColor: Colors.green,
  //         textStyle: TextStyle(
  //           fontSize: 50.0,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _rotate() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 20.0, height: 20.0),
        const Text(
          'KJ',
          style: TextStyle(fontSize: 35.0),
        ),
        const SizedBox(width: 40.0, height: 40.0),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
          child: AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              animatedTexts: [
                RotateAnimatedText('Hello!'),
                RotateAnimatedText('こんにちは！'),
                RotateAnimatedText('여보! '),
                RotateAnimatedText('你好！'),
              ]),
        ),
      ],
    );
  }

  loginControllers(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              child: FloatingActionButton.extended(
            onPressed: () {
              Provider.of<LoginController>(context, listen: false)
                  .googleLogin();
            },
            icon: Image.asset(
              "assets/google_tra.png",
              height: 32,
              width: 32,
            ),
            label: Text("   Sign in with Google  "),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black38,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black54, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          )),

          SizedBox(
            height: 15,
          ),
          GestureDetector(
              child: FloatingActionButton.extended(
            onPressed: () {
              Provider.of<LoginController>(context, listen: false)
                  .facebooklogin();
            },
            icon: Image.asset(
              "assets/facebook_tra.png",
              height: 32,
              width: 32,
            ),
            label: Text("Sign in with Facebook"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black38,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black54, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          )),
          // onTap: () {
          //   Provider.of<LoginController>(context, listen: false)
          //       .googleLogin();
          // }),

          // Image.asset(
          //   "assets/google.png",
          //   width: 240,
          // ),
          // onTap: () {
          //   Provider.of<LoginController>(context, listen: false)
          //       .googleLogin();
          // }),
        ],
      ),
    );
  }
}
// GestureDetector(
//               child: Image.asset(
//                 "assets/google.png",
//                 width: 240,
//               ),
//               onTap: () {
//                 Provider.of<LoginController>(context, listen: false)
//                     .googleLogin();
//               }),
//           SizedBox(
//             height: 10,
//           ),
//           GestureDetector(
//               child: Image.asset(
//                 "assets/fb.png",
//                 width: 240,
//               ),
//               onTap: () {
//                 Provider.of<LoginController>(context, listen: false)
//                     .facebooklogin();
//               }),
