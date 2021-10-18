import 'package:flutter/material.dart';
import 'package:kjapp/login_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  _IdentityPageState createState() => _IdentityPageState();
}

class _IdentityPageState extends State {
  // LoginPage log= new LoginPage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loggedInUI(model),
    );
    // backgroundColor: Colors.white,
    // body: SafeArea(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: <Widget>[
    //       SizedBox(
    //         height: 40,
    //       ),
    //       Padding(
    //         padding: EdgeInsets.fromLTRB(00, 0, 0, 20),
    //         child: Align(
    //           alignment: Alignment.topCenter,
    //           child: Container(
    //             // padding: EdgeInsets.symmetric(
    //             //   horizontal: 20,
    //             //   vertical: 30,
    //             // ),
    //             child: loggedInUI(model),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         // padding: EdgeInsets.fromLTRB(00, 0, 0, 40),

    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: Colors.green,
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(30),
    //               topRight: Radius.circular(30),
    //             ),
    //           ),
    //           child: MediaGrid(),
    //         ),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.fromLTRB(00, 0, 0, 20),
    //         child: PagesAll[myindex],
    //       ),
    //     ],
    //   ),
    // ),
    // );
  }
}
