// import 'dart:html';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kjapp/controllers/login_controller.dart';
import 'package:kjapp/final_Stage.dart';
import 'package:kjapp/upload_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

class Nokosu extends StatefulWidget {
  // final File ;
  final img_string;
  final description;
  final location;
  final category;
  final posNeg;

  // ImageData imageData;

  Nokosu(
      {this.img_string,
      this.description,
      this.location,
      this.category,
      this.posNeg});

  @override
  _NokosuState createState() => _NokosuState();
}

class _NokosuState extends State<Nokosu> {
  GlobalKey previewContainer = new GlobalKey();
  bool click = true;
  // String categoryType = widget.category;
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(builder: (context, model, child) {
      return Center(
          child:
              model.userDetails != null ? render(model, context) : Container());
    });
  }

  render(LoginController model, context) {
    String UserName = model.userDetails!.displayName ?? "";
    // Uint8List Myimage = base64Decode(widget.img_string);
    // var _image = MemoryImage(Myimage);

    // return Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //       decoration: BoxDecoration(
    //           border: Border.all(
    //             width: 5,
    //             color: (click == false)
    //                 ? Colors.orange.shade400
    //                 : Colors.purple.shade400,
    //             // color: Colors.orange.shade400,
    //           ),
    //           image: DecorationImage(
    //             //  image: Image.asset('images/cat.png'),
    //             image: Image.memory(base64Decode(widget.img_string)).image,
    //           )),
    //       child: Stack(
    //         children: [
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Text(
    //             UserName,
    //             style: TextStyle(
    //                 fontFamily: "ProximaNova-Regular",
    //                 fontSize: 16,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.w400),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Text(
    //             widget.description,
    //             style: TextStyle(
    //                 fontFamily: "Proxima-Nova-Extrabold",
    //                 fontSize: 15,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.w600),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Text(
    //             widget.location,
    //             style: TextStyle(
    //                 fontFamily: "ProximaNova-Regular",
    //                 fontSize: 12,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.w400),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Text(
    //             widget.category,
    //             style: TextStyle(
    //                 fontFamily: "ProximaNova-Regular",
    //                 fontSize: 12,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.w400),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Text(
    //             widget.posNeg,
    //             style: TextStyle(
    //                 fontFamily: "ProximaNova-Regular",
    //                 fontSize: 30,
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.w400),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.blue])),
          ),
          // title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  buildCard(model, context),
                  buildCard(model, context),
                  buildCard(model, context),
                  buildCard(model, context),
                  buildCard(model, context),
                  buildCard(model, context),
                  buildCard(model, context),
                ],
              )),
        ));
  }

  Card buildCard(LoginController model, context) {
    String UserName1 = model.userDetails!.displayName ?? "";
    var heading = '\$2300 per month';
    var subheading = '2 bed, 1 bath, 1300 sqft';
    var cardImage =
        NetworkImage('https://source.unsplash.com/random/800x600?house');
    var supportingText = widget.description;

    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          // ListTile(
          //   title: showCondition(),
          //   subtitle: PostiveNegative(),
          //   // trailing: Icon(Icons.favorite_outline),
          //   // trailing: showCondition(),
          // ),
          Container(
            height: 50.0,
            child: Row(
              children: [
                PostiveNegative(),
                showCondition(),
                Positioned(
                  right: 2,
                  child: Text(UserName1,
                      style: const TextStyle(color: Colors.black)),
                ),
                IconButton(
                  icon: Icon(Icons.download),
                  iconSize: 20,
                  alignment: Alignment.centerRight,
                  onPressed: _captureSocialPng1,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Ink.image(
              // image: cardImage,

              image: Image.memory(base64Decode(widget.img_string)).image,

              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(widget.location),
          ),
          // ButtonBar(
          //     // children: [
          //     //   TextButton(
          //     //     child: const Text('CONTACT AGENT'),
          //     //     onPressed: () {/* ... */},
          //     //   ),
          //     //   TextButton(
          //     //     child: const Text('LEARN MORE'),
          //     //     onPressed: () {/* ... */},
          //     //   )
          //     // ],
          //     ),
          // Positioned(
          //   child: IconButton(
          //     icon: Icon(Icons.download),
          //     iconSize: 32,
          //     alignment: Alignment.center,
          //     onPressed: _captureSocialPng1,
          //   ),
          // ),
        ],
      ),
    );
  }

  showCondition() {
    if (widget.category == "Cultural") {
      // PostiveNegative();
      return Icon(Icons.circle, color: Colors.green);
    } else if (widget.category == "Physical") {
      // PostiveNegative();
      return Icon(Icons.circle, color: Colors.blue);
    } else {
      // PostiveNegative();
      return Icon(Icons.favorite_outline, color: Colors.red);
    }
  }

  PostiveNegative() {
    if (widget.posNeg == "true") {
      return Icon(Icons.circle, color: Colors.orange);
    } else {
      return Icon(Icons.circle, color: Colors.purple);
    }
  }

  Future<void> _captureSocialPng1() {
    List<String> imagePaths = [];
    final RenderBox box = context.findRenderObject() as RenderBox;
    return new Future.delayed(const Duration(milliseconds: 20), () async {
      RenderRepaintBoundary? boundary = previewContainer.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;

      ui.Image image = await boundary!.toImage(pixelRatio: 2.0);
      // ui.Image image = await boundary!.toImage();
      final directory = (await getApplicationDocumentsDirectory()).path;

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      File imgFile = new File('$directory/nokosu_${DateTime.now()}.png');
      imagePaths.add(imgFile.path);
      imgFile.writeAsBytes(pngBytes).then((value) async {
        await Share.shareFiles(imagePaths,
            subject: 'Share',
            text: 'Check this Out!',
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      }).catchError((onError) {
        print(onError);
      });
    });
  }
}
