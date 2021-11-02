// ignore_for_file: import_of_legacy_library_into_null_safe, dead_code

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kjapp/card.dart';
import 'package:kjapp/controllers/login_controller.dart';
import 'package:kjapp/nokosu.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:uuid/uuid.dart';
// import 'dart:async';
// import 'main.dart';
// import 'package:geocoder/geocoder.dart';
import 'dart:io';
import 'location.dart';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:kjapp/animated_toggle.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Uploader extends StatefulWidget {
  _Uploader createState() => _Uploader();
}

class _Uploader extends State<Uploader> {
  File? file;

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  late Address address;

  Map<String, double> currentLocation = Map();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  bool uploading = false;

  Widget build(BuildContext context) => file == null
      ? Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(00, 50, 0, 20),
                      child: IconButton(
                          icon: Icon(Icons.image),
                          iconSize: 70,
                          hoverColor: Colors.green.shade600,
                          alignment: Alignment.center,
                          onPressed: () => {_selectImage(context)}),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(00, 0, 0, 0),
                      child: const Text('Create a KJ card. '),
                    ),
                  ]),
            ),
          ),
        )
      : Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            // backgroundColor: Colors.white70,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.green, Colors.blue])),
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: clearImage),
            title: const Text(
              'Post to',
              style: const TextStyle(color: Colors.white),
            ),

            actions: <Widget>[
              Container(
                  child: ElevatedButton(
                child: Text("Nokosu".toUpperCase(),
                    style: TextStyle(fontSize: 12)),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //     RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.zero,
                  //         side: BorderSide(color: Colors.green)))
                ),
                onPressed: () => ShowDialog(context),
              )),
              FlatButton(
                  onPressed: postImage,
                  child: Text(
                    "KJ 法",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ))
            ],
          ),
          body: ListView(
            children: <Widget>[
              PostForm(
                imageFile: file,
                descriptionController: descriptionController,
                locationController: locationController,
                loading: uploading,
              ),
              Divider(), //scroll view where we will show location to users
              (address == null)
                  ? Container()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(right: 5.0, left: 5.0),
                      child: Row(
                        children: <Widget>[
                          buildLocationButton(address.featureName),
                          buildLocationButton(address.subLocality),
                          buildLocationButton(address.locality),
                          buildLocationButton(address.subAdminArea),
                          buildLocationButton(address.adminArea),
                          buildLocationButton(address.countryName),
                        ],
                      ),
                    ),
              // ignore: unnecessary_null_comparison
              (address == null) ? Container() : Divider(),

              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Container(
                  //     child: ElevatedButton(
                  //   child: Text("Done".toUpperCase(),
                  //       style: TextStyle(fontSize: 14)),
                  //   style: ButtonStyle(
                  //       foregroundColor:
                  //           MaterialStateProperty.all<Color>(Colors.white),
                  //       backgroundColor:
                  //           MaterialStateProperty.all<Color>(Colors.green),
                  //       shape:
                  //           MaterialStateProperty.all<RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.zero,
                  //                   side: BorderSide(color: Colors.green)))),
                  //   onPressed: () => ShowDialog(context),
                  // ))
                ],
              ),
            ],
          ));

  @override
  initState() {
    //variables with location assigned as 0.0
    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;
    initPlatformState(); //method to call location
    super.initState();
  }

  //method to get Location and save into variables
  initPlatformState() async {
    Address first = await getUserLocation();
    setState(() {
      address = first;
    });
  }

  //method to build buttons with location.
  buildLocationButton(String locationName) {
    // ignore: unnecessary_null_comparison
    if (locationName != null) {
      return InkWell(
        onTap: () {
          locationController.text = locationName;
        },
        child: Center(
          child: Container(
            //width: 100.0,
            height: 30.0,
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            margin: EdgeInsets.only(right: 3.0, left: 3.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                locationName,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  ShowDialog(BuildContext parentContext) async {
    var myindex = 0;

    bool toggle = false;
    bool Position = true;
    return showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      context: context,
      pageBuilder: (_, __, ___) {
        String text1;
        String text2;
        String text3;

        return Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: 300,
                child: SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        //Use of SizedBox
                        height: 30,
                      ),
                      LiteRollingSwitch(
                        value: true,
                        textOn: 'Positive',
                        textOff: 'Negative',
                        colorOn: Colors.orangeAccent,
                        colorOff: Colors.purpleAccent,
                        iconOn: Icons.thumb_up_sharp,
                        iconOff: Icons.thumb_down,
                        textSize: 8,
                        onChanged: (bool postiion) {
                          Position = postiion;
                          print("the button is $postiion ");
                        },
                      ),
                      SizedBox(
                        //Use of SizedBox
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          "Select the most appropriate category.",
                          style: TextStyle(
                            fontSize: 8.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        //Use of SizedBox
                        height: 20,
                      ),
                      DefaultTabController(
                          length: 3,
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Material(
                                    color: Colors.white,
                                    child: TabBar(
                                      unselectedLabelColor: Colors.black,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      indicator: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.green,
                                            Colors.blue
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.redAccent),
                                      tabs: [
                                        Tab(
                                          icon: ImageIcon(
                                            AssetImage(
                                                "assets/emotionally-stable.png"),
                                            color: Colors.pink.shade100,
                                          ),
                                        ),
                                        Tab(
                                          icon: ImageIcon(
                                            AssetImage("assets/solid.png"),
                                            color: Colors.blue.shade200,
                                          ),
                                        ),
                                        Tab(
                                          icon: ImageIcon(
                                            AssetImage("assets/cultures.png"),
                                            color: Colors.yellow.shade700,
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  //Use of SizedBox
                                  height: 30,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: TabBarView(
                                    children: [
                                      Center(
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                "Emotional",
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(
                                              //Use of SizedBox
                                              height: 20,
                                            ),
                                            Container(
                                                child: RoundedLoadingButton(
                                              child: Text('Done',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              controller: _btnController,
                                              onPressed: () => _doSomething1(
                                                  "Emotional", Position),
                                            )),
                                          ],
                                        ),
                                      ),
                                      // Icon(Icons.directions_car),
                                      Center(
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                "Physical",
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(
                                              //Use of SizedBox
                                              height: 20,
                                            ),
                                            Container(
                                                child: RoundedLoadingButton(
                                              child: Text('Done',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              controller: _btnController,
                                              onPressed: () => _doSomething2(
                                                  "Physical", Position),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                "Cultural",
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(
                                              //Use of SizedBox
                                              height: 20,
                                            ),
                                            Container(
                                                child: RoundedLoadingButton(
                                              child: Text('Done',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              controller: _btnController,
                                              onPressed: () => _doSomething3(
                                                  "Cultural", Position),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                margin:
                    EdgeInsets.only(top: 50, bottom: 50, left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  void _doSomething3(String text, bool boolVal) async {
    String base64String = base64Encode(file!.readAsBytesSync());

    Timer(Duration(seconds: 1), () {
      _btnController.success();
    });
    final String img_string = base64String;
    final String description = descriptionController.text;
    final String location = locationController.text;
    final String text3 = text;
    final String boolValue = boolVal.toString();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Nokosu(
                img_string: img_string,
                description: description,
                location: location,
                category: text3,
                posNeg: boolValue,
              )),
    );
  }

  void _doSomething2(String text, bool boolVal) async {
    String base64String = base64Encode(file!.readAsBytesSync());

    Timer(Duration(seconds: 3), () {
      _btnController.success();
    });

    final String img_string = base64String;
    final String description = descriptionController.text;
    final String location = locationController.text;
    final String text3 = text;
    final String boolValue = boolVal.toString();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Nokosu(
                img_string: img_string,
                description: description,
                location: location,
                category: text3,
                posNeg: boolValue,
              )),
    );
  }

  void _doSomething1(String text, bool boolVal) async {
    String base64String = base64Encode(file!.readAsBytesSync());

    Timer(Duration(seconds: 1), () {
      _btnController.success();
    });

    final String img_string = base64String;
    final String description = descriptionController.text;
    final String location = locationController.text;
    final String text3 = text;
    final String boolValue = boolVal.toString();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Nokosu(
                img_string: img_string,
                description: description,
                location: location,
                category: text3,
                posNeg: boolValue,
              )),
    );
  }

  _selectImage(BuildContext parentContext) async {
    return showDialog<Null>(
      context: parentContext,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return SimpleDialog(
          // backgroundColor: Colors.green.shade200,
          title: const Text('Create a KJ card'),
          children: <Widget>[
            SimpleDialogOption(
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  PickedFile? imageFile = await imagePicker.getImage(
                      source: ImageSource.camera,
                      maxWidth: 1920,
                      maxHeight: 1200,
                      imageQuality: 80);
                  setState(() {
                    file = File(imageFile!.path);
                  });
                }),
            SimpleDialogOption(
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  PickedFile? imageFile = await imagePicker.getImage(
                      source: ImageSource.gallery,
                      maxWidth: 1920,
                      maxHeight: 1200,
                      imageQuality: 80);
                  setState(() {
                    file = File(imageFile!.path);
                  });
                }),
            SimpleDialogOption(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  // _dialogpositive(BuildContext parentContext) async {
  //   return showDialog<Null>(
  //     context: parentContext,
  //     barrierDismissible: false, // user must tap button!

  //     builder: (BuildContext context) {
  //       int _toggleValue = 0;
  //       return SimpleDialog(
  //         // backgroundColor: Colors.green.shade200,
  //         title: const Text('Create a KJ card'),
  //         children: <Widget>[
  //           SimpleDialogOption(
  //               // child: Column(
  //               //   mainAxisAlignment: MainAxisAlignment.center,
  //               //   children: [
  //               //     AnimatedToggle(
  //               //       values: ['English', 'Arabic'],
  //               //       onToggleCallback: (value) {
  //               //         setState(() {
  //               //           _toggleValue = value;
  //               //         });
  //               //       },
  //               //       buttonColor: const Color(0xFF0A3157),
  //               //       backgroundColor: const Color(0xFFB5C1CC),
  //               //       textColor: const Color(0xFFFFFFFF),
  //               //     ),
  //               //     Text('Toggle Value : $_toggleValue'),
  //               //   ],
  //               // ),
  //               ),
  //           SimpleDialogOption(),
  //           SimpleDialogOption()
  //         ],
  //       );
  //     },
  //   );
  // }

  void clearImage() {
    setState(() {
      file = null;
    });
  }

  // void postImage() {
  //   setState(() {
  //     uploading = true;
  //   });
  //   uploadImage(file).then((String data) {
  //     postToFireStore(
  //         mediaUrl: data,
  //         description: descriptionController.text,
  //         location: locationController.text);
  //   }).then((_) {
  //     setState(() {
  //       file = null;
  //       uploading = false;
  //     });
  //   });
  // }

  void postImage() {
    String base64String = base64Encode(file!.readAsBytesSync());

    final String img_string = base64String;
    final String description = descriptionController.text;
    final String location = locationController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CardDesign(
                img_string: img_string,
                description: description,
                location: location,
              )),
    );
  }
}

class PostForm extends StatelessWidget {
  final imageFile;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final bool loading;
  PostForm(
      {this.imageFile,
      required this.descriptionController,
      required this.loading,
      required this.locationController});

  Widget build(BuildContext context) {
    return Consumer<LoginController>(builder: (context, model, child) {
      return Center(
          child: model.userDetails != null
              ? rendering(model, context)
              : Container());
    });
  }

  rendering(LoginController model, BuildContext context) {
    return Column(
      children: <Widget>[
        loading
            ? LinearProgressIndicator()
            : Padding(padding: EdgeInsets.only(top: 0.0)),
        Divider(),
        Padding(
          padding: EdgeInsets.fromLTRB(00, 30, 0, 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                image: DecorationImage(
              // fit: BoxFit.fill,
              alignment: FractionalOffset.center,
              image: FileImage(imageFile),
            )),
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundImage:
                  Image.network(model.userDetails!.photoURL ?? "").image,
              radius: 20,
            ),
            Container(
              width: 250.0,
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: "Write a comment...", border: InputBorder.none),
              ),
            ),
          ],
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.pin_drop),
          title: Container(
            width: 250.0,
            child: TextField(
              controller: locationController,
              decoration: InputDecoration(
                  hintText: "Where was this photo taken?",
                  border: InputBorder.none),
            ),
          ),
        )
      ],
    );
  }
}

// class postiveDialogBox extends StatefulWidget {
//   postiveDialogBox({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _postiveDialogBoxState createState() => _postiveDialogBoxState();
// }

// class _postiveDialogBoxState extends State<postiveDialogBox> {
//   @override
//   Widget build(BuildContext context) {
//     int _toggleValue = 0;

//     return SimpleDialog(
//       // backgroundColor: Colors.green.shade200,
//       title: const Text('Create a KJ card'),
//       children: <Widget>[
//         SimpleDialogOption(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AnimatedToggle(
//                 values: ['English', 'Arabic'],
//                 onToggleCallback: (value) {
//                   setState(() {
//                     _toggleValue = value;
//                   });
//                 },
//                 buttonColor: const Color(0xFF0A3157),
//                 backgroundColor: const Color(0xFFB5C1CC),
//                 textColor: const Color(0xFFFFFFFF),
//               ),
//               Text('Toggle Value : $_toggleValue'),
//             ],
//           ),
//         ),
//         SimpleDialogOption(
//             // child: const Text('Choose from Gallery'),
//             // onPressed: () async {
//             //   Navigator.of(context).pop();
//             //   PickedFile? imageFile = await imagePicker.getImage(
//             //       source: ImageSource.gallery,
//             //       maxWidth: 1920,
//             //       maxHeight: 1200,
//             //       imageQuality: 80);
//             //   setState(() {
//             //     file = File(imageFile!.path);
//             //   });
//             // }

//             ),
//         SimpleDialogOption(

//             // child: const Text("Cancel"),
//             // onPressed: () {
//             //   Navigator.pop(context);
//             // },
//             )
//       ],
//     );
//   }
// }

// Future<String> uploadImage(var imageFile) async {
//   var uuid = Uuid().v1();
//   Reference ref = FirebaseStorage.instance.ref().child("post_$uuid.jpg");
//   UploadTask uploadTask = ref.putFile(imageFile);

//   String downloadUrl = await (await uploadTask).ref.getDownloadURL();
//   return downloadUrl;
// }

// void postToFireStore(
//     {String mediaUrl, String location, String description}) async {
//   var reference = FirebaseFirestore.instance.collection('insta_posts');

//   reference.add({
//     "username": currentUserModel.username,
//     "location": location,
//     "likes": {},
//     "mediaUrl": mediaUrl,
//     "description": description,
//     "ownerId": googleSignIn.currentUser.id,
//     "timestamp": DateTime.now(),
//   }).then((DocumentReference doc) {
//     String docId = doc.id;
//     reference.doc(docId).update({"postId": docId});
//   });
// }
