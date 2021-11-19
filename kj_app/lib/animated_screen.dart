import 'package:flutter/material.dart';
import 'package:kjapp/beforeloginpage.dart';
import 'package:kjapp/controllers/login_controller.dart';
import 'package:kjapp/login_page.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:provider/provider.dart';

class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  LiquidController _liquidController = LiquidController();

  // List<Widget> pages = [
  //   Container(
  //     color: Colors.orange.shade900,
  //     child: Column(
  //       children: [
  //         Container(
  //           // height: 400,
  //           // width: 300,
  //           child: Image.asset('assets/screen1.png'),
  //         ),
  //         SizedBox(
  //           height: 50.0,
  //         ),
  //         Text(
  //           "Adding a Comment",
  //           // style: GoogleFonts.itim(fontSize: 24.0),
  //         ),
  //         SizedBox(
  //           height: 20.0,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 16.0, right: 16.0),
  //           child: Text(
  //             "User can enter a comment here. ",
  //             // style: GoogleFonts.itim(
  //             //   fontSize: 18.0,
  //             // ),
  //             textAlign: TextAlign.center,
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 16.0, right: 16.0),
  //           child: FlatButton(
  //             color: Colors.teal,
  //             textColor: Colors.white,
  //             onPressed: () {},
  //             child: Text('GO TO SCREEN 2'),
  //           ),
  //         )
  //       ],
  //     ),
  //   ),
  //   Container(
  //     color: Colors.green,
  //     child: Column(
  //       children: [
  //         Container(
  //           // height: 400,
  //           // width: 300,
  //           child: Image.asset('assets/screen2.png'),
  //         ),
  //         SizedBox(
  //           height: 50.0,
  //         ),
  //         Text(
  //           "Select the category",
  //           // style: GoogleFonts.itim(fontSize: 24.0, color: Colors.white),
  //         ),
  //         SizedBox(
  //           height: 20.0,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 16.0, right: 16.0),
  //           child: Text(
  //             "Select most appropriate category accodring to the image",
  //             // style: GoogleFonts.itim(fontSize: 18.0, color: Colors.white),
  //             // textAlign: TextAlign.center
  //           ),
  //         )
  //       ],
  //     ),
  //   ),
  //   Container(
  //     color: Colors.orange.shade700,
  //     child: Column(
  //       children: [
  //         Container(
  //           // height: 400,
  //           // width: 300,
  //           child: Image.asset('assets/screen3.png'),
  //         ),
  //         SizedBox(
  //           height: 50.0,
  //         ),
  //         Text(
  //           "Nokosu Card Final look",
  //           // style: GoogleFonts.itim(fontSize: 24.0),
  //         ),
  //         SizedBox(
  //           height: 20.0,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 16.0, right: 16.0),
  //           child: Text(
  //             "Nokosu is helping us to save our memories with a comment.",
  //             // style: GoogleFonts.itim(
  //             //   fontSize: 18.0,
  //             // ),
  //             textAlign: TextAlign.center,
  //           ),
  //         )
  //       ],
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        // body: Builder(
        //   builder: (context) => LiquidSwipe(
        // body: LiquidSwipe(
        // pages: pages,
        body: LiquidSwipe(
          pages: [
            Container(
              // color: Colors.orange.shade900,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.orange.shade400, Colors.blue])),
              child: Column(
                children: [
                  Container(
                    // height: 400,
                    // width: 300,
                    child: Image.asset('assets/screen1.png'),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Write a Comment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    // style: GoogleFonts.itim(fontSize: 24.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "Save your thoughts, impressions and emotions together with the photo to look back anytime.",
                      // style: GoogleFonts.itim(
                      //   fontSize: 18.0,
                      // ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.orange.shade400, Colors.blue])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: FlatButton(
                        // color: Colors.teal,
                        textColor: Colors.white,
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => BeforeLoginPage())),
                        },
                        child: Text('skip'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // color: Colors.green,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.green.shade400, Colors.blue.shade400])),
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/screen22.png'),
                    // child: Image.asset('assets/3trans.png'),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Select Category",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),

                    textAlign: TextAlign.center,
                    // style: GoogleFonts.itim(fontSize: 24.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "Label your captures with icons to help you categorize                                      ",
                      // style: GoogleFonts.itim(fontSize: 18.0, color: Colors.white),
                      // textAlign: TextAlign.center
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 108.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Colors.green.shade400,
                          Colors.blue.shade400
                        ])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: FlatButton(
                        // color: Colors.teal,
                        textColor: Colors.white,
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => BeforeLoginPage())),
                        },
                        child: Text('skip'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // color: Colors.orange.shade700,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.pink.shade400, Colors.deepPurple])),
              child: Column(
                children: [
                  Container(
                    // height: 400,
                    // width: 300,
                    child: Image.asset('assets/screen3.png'),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Resulting Look",
                    // style: GoogleFonts.itim(fontSize: 24.0),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      "Nokosu helps you capture the moments with ease                                             ",
                      // style: GoogleFonts.itim(
                      //   fontSize: 18.0,
                      // ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 108.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.pink.shade400, Colors.deepPurple])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: FlatButton(
                        // color: Colors.teal,
                        textColor: Colors.white,
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context1) => BeforeLoginPage())),
                        },
                        child: Text('skip'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
          liquidController: _liquidController,
          waveType: WaveType.liquidReveal,
          enableLoop: true,
          slideIconWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(
                Icons.arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // ),
      ),
    );
  }

  // nextpage() {
  //   // Navigator.of(context)
  //   //     .push(MaterialPageRoute(builder: (context) => AnimatedScreen()));
  //   // return Container();

  //   return MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(
  //         create: (context) => LoginController(),
  //         child: LoginPage(),

  //         // child: MainPage(),
  //       )
  //     ],
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,

  //       home: (BeforeLoginPage),

  //       // AnimatedSplashScreen(
  //       //   splash: Lottie.asset(
  //       //     'assets/74423-photography.json',
  //       //   ),
  //       //   // nextScreen: MainPage(),
  //       //   nextScreen: LoginPage(),
  //       //   splashTransition: SplashTransition.fadeTransition,
  //       //   backgroundColor: Colors.lightGreen,
  //       //   duration: 1550,
  //       // ),
  //       // locale: DevicePreview.locale(context), // Add the locale here
  //       // builder: DevicePreview.appBuilder, // Add the builder here
  //     ),
  //   );
  // }
}
