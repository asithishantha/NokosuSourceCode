import 'package:flutter/material.dart';
import 'package:kjapp/gallery.dart';
import 'package:kjapp/login_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _IdentityPageState createState() => _IdentityPageState();
}

class _IdentityPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            // padding: EdgeInsets.fromLTRB(00, 0, 0, 40),

            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: MediaGrid(),
            ),
          ),
        ],
      ),
    );
  }
}
