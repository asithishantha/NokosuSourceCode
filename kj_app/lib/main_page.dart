import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kjapp/card.dart';
import 'package:kjapp/home_page.dart';
import 'package:kjapp/profile.dart';
import 'package:kjapp/upload_page.dart';
import 'package:kjapp/dialog.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State {
  GlobalKey _NavKey = GlobalKey();

  var PagesAll = [
    HomePage(),
    ProfilePage(),
  ];

  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
//         onPressed: () => {
//            print('Yeah.. The FloatingActionButton is pressed.'),
//            Navigator.push(context, MaterialPageRoute(builder: (context) {
// return CardDesign(); }

//           }

        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            // return CardDesign();
            // return DialogField();
            return Uploader();
          }));
        }, //

        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        key: _NavKey,
        items: [
          Icon((myindex == 0)
              ? Icons.perm_identity
              : Icons.perm_contact_cal_rounded),
          // Icon((myindex == 1) ? Icons.message : Icons.message_outlined),
          // Icon((myindex == 2) ? Icons.favorite_border : Icons.favorite),
          Icon((myindex == 1) ? Icons.home_outlined : Icons.home)
        ],
        buttonBackgroundColor: Colors.amberAccent,
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        animationCurve: Curves.fastLinearToSlowEaseIn,
        color: Colors.green,
      ),
      body: PagesAll[myindex],
    );
  }
}
