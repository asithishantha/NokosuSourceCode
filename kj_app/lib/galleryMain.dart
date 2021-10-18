import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_project/FavoritePage.dart';
// import 'package:flutter_project/HomePage.dart';
// import 'package:flutter_project/IdentityPage.dart';
// import 'package:flutter_project/MessagePage.dart';

// import 'package:flutter_project/MessagePage.dart';
import 'package:kjapp/HomePage.dart';
import 'package:kjapp/gallery.dart';
import 'package:kjapp/profile.dart';
import 'package:kjapp/controllers/Login_Controller.dart';
import 'package:kjapp/login_page.dart';

class GalleryMain extends StatefulWidget {
  const GalleryMain({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  GlobalKey _NavKey = GlobalKey();

  var PagesAll = [
    EditPage(),
    ProfilePage(),
  ];

  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        key: _NavKey,
        items: [
          Icon((myindex == 0) ? Icons.home_outlined : Icons.home),
          Icon((myindex == 1) ? Icons.message : Icons.message_outlined),
          Icon((myindex == 2) ? Icons.favorite_border : Icons.favorite),
          Icon((myindex == 3)
              ? Icons.perm_identity
              : Icons.perm_contact_cal_rounded)
        ],
        buttonBackgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        animationCurve: Curves.fastLinearToSlowEaseIn,
        color: Colors.orange,
      ),
      body: PagesAll[myindex],
    );
  }
}
