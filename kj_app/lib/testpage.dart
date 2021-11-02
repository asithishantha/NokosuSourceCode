import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class TestPage extends StatefulWidget {
  // final File ;
  final snapshot;

  // ImageData imageData;

  TestPage({this.snapshot});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: Positioned.fill(
              child: Image.memory(
                widget.snapshot.data!,
              ),
            ),
          ),
        ],
      ),
    );

    // return Column(
    //   children: <Widget>[
    //     // loading
    //     //     ? LinearProgressIndicator()
    //     //     : Padding(padding: EdgeInsets.only(top: 0.0)),
    //     Divider(),
    //     Padding(
    //       padding: EdgeInsets.fromLTRB(00, 30, 0, 10),
    //       child: Container(
    //         // height: MediaQuery.of(context).size.height * 0.3,
    //         // width: MediaQuery.of(context).size.width * 0.5,
    //         decoration: BoxDecoration(
    //             image: DecorationImage(
    //           // fit: BoxFit.fill,
    //           alignment: FractionalOffset.center,
    //           image: Image.memory(widget.snapshot.data!).image,
    //         )),
    //       ),
    //     ),
    //     Divider(),
    //     // Row(
    //     //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     //   children: <Widget>[
    //     //     CircleAvatar(
    //     //       backgroundImage:
    //     //           Image.network(model.userDetails!.photoURL ?? "").image,
    //     //       radius: 20,
    //     //     ),
    //     //     Container(
    //     //       width: 250.0,
    //     //       child: TextField(
    //     //         controller: descriptionController,
    //     //         decoration: InputDecoration(
    //     //             hintText: "Write a comment...", border: InputBorder.none),
    //     //       ),
    //     //     ),
    //     //   ],
    //     // ),
    //     Divider(),
    //     // ListTile(
    //     //   leading: Icon(Icons.pin_drop),
    //     //   title: Container(
    //     //     width: 250.0,
    //     //     child: TextField(
    //     //       controller: locationController,
    //     //       decoration: InputDecoration(
    //     //           hintText: "Where was this photo taken?",
    //     //           border: InputBorder.none),
    //     //     ),
    //     //   ),
    //     // )
    //   ],
    // );
  }
}
