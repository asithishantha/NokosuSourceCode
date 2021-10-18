// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_project/FavoritePage.dart';
// import 'package:flutter_project/HomePage.dart';
// import 'package:flutter_project/IdentityPage.dart';
// import 'package:flutter_project/MessagePage.dart';
// import 'package:kjapp/HomePage.dart';
// import 'package:kjapp/profile.dart';

// import 'gallery.dart';

// import 'package:flutter/material.dart';
// import 'package:kjapp/controllers/login_controller.dart';
// import 'package:provider/provider.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:kjapp/login_page.dart';

// class realGallery extends StatefulWidget {
//   const realGallery({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State {
//   LoginPage loginPage = new LoginPage();
//   GlobalKey _NavKey = GlobalKey();

// // var PagesAll = [HomePage()];

//   var myindex = 0;
//   var PagesAll = [
//     EditPage(),
//     profilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.transparent,
//         key: _NavKey,
//         items: [
//           Icon(Icons.home),
//           // Icon(Icons.message_outlined),
//           // Icon(Icons.favorite),
//           Icon(Icons.perm_contact_cal_rounded)
//         ],
//         buttonBackgroundColor: Colors.white,
//         onTap: (index) {
//           setState(() {
//             // onTap
//           });
//         },
//         animationCurve: Curves.fastLinearToSlowEaseIn,
//         color: Colors.orange,
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             SizedBox(
//               height: 40,
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(00, 0, 0, 20),
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Container(
//                   // padding: EdgeInsets.symmetric(
//                   //   horizontal: 20,
//                   //   vertical: 30,
//                   // ),
//                   child: loginPage.loggedInUI(model),
//                 ),
//               ),
//             ),
//             Expanded(
//               // padding: EdgeInsets.fromLTRB(00, 0, 0, 40),

//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: MediaGrid(),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(00, 0, 0, 20),
//               child: PagesAll[myindex],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
