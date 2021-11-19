import 'package:kjapp/animated_screen.dart';
import 'package:kjapp/main_page.dart';
import 'package:kjapp/home_page.dart';
import 'package:kjapp/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:kjapp/controllers/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey _NavKey = GlobalKey();

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  //   var myindex = 0;
  var PagesAll = [
    HomePage(),
    UserProfile(),
  ];

  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: loginUI(),
    );
  }

  loginUI() {
    return Consumer<LoginController>(builder: (context, model, child) {
      if (model.userDetails != null) {
        return Container();
      } else {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.orange.shade400, Colors.blue])),
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
                              'assets/ourlogo2.png',
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
                                color: Colors.white,
                                fontSize: 32.0,
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                isRepeatingAnimation: true,
                                animatedTexts: [
                                  RotateAnimatedText(' Hello！'),
                                  RotateAnimatedText('こんにちは！'),
                                  RotateAnimatedText('여보! '),
                                  RotateAnimatedText('你好！'),
                                ],
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
                                color: Colors.white,
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
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //       child: RoundedLoadingButton(
                      //           child: Text('Make a Tour',
                      //               style: TextStyle(color: Colors.black)),
                      //           controller: _btnController,
                      //           onPressed: () => {
                      //                 Navigator.of(context).push(
                      //                     MaterialPageRoute(
                      //                         builder: (context) =>
                      //                             AnimatedScreen())),
                      //               })),
                      //   // child: Container(
                      //   //   decoration: BoxDecoration(
                      //   //     shape: BoxShape.circle,
                      //   //     color: Colors.black,
                      //   //   ),
                      //   //   child: Icon(
                      //   //     Icons.arrow_right,
                      //   //     color: Colors.white,

                      //   //   ),
                      //   // ),
                      // ),
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
              Provider.of<LoginController>(context, listen: false)
                  .logout(context);
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
            color: Colors.white,
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
                  .googleLogin(context);
            },
            icon: Image.asset(
              "assets/google_tra.png",
              height: 30,
              width: 30,
            ),
            label: Text("   Sign in with Google  "),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black54,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black54, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
              // borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
          )),

          SizedBox(
            height: 15,
          ),
          GestureDetector(
              child: FloatingActionButton.extended(
            onPressed: () {
              Provider.of<LoginController>(context, listen: false)
                  .facebooklogin(context);
            },
            icon: Image.asset(
              "assets/facebook_tra.png",
              height: 30,
              width: 30,
            ),
            label: Text("Sign in with Facebook"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black54,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black54, width: 1.0),
              // borderRadius: BorderRadius.all(Radius.circular(10.0))
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
            ),
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
