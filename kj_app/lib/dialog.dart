import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kjapp/controllers/login_controller.dart';
// import 'package:uuid/uuid.dart';
// import 'dart:async';
// import 'main.dart';
import 'dart:io';
import 'location.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:provider/provider.dart';

class DialogField extends StatefulWidget {
  const DialogField({Key? key}) : super(key: key);

  @override
  _DialogFieldState createState() => _DialogFieldState();
}

class _DialogFieldState extends State {
  late File file;
  //Strings required to save address
  late Address address;

  Map<String, double> currentLocation = Map();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  bool uploading = false;

  @override
  initState() {
    //variables with location assigned as 0.0
    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;
    initPlatformState(); //method to call location
    super.initState();
  }

  initPlatformState() async {
    Address first = await getUserLocation();
    setState(() {
      address = first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
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
  }
}
