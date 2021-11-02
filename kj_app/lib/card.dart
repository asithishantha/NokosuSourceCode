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

class CardDesign extends StatefulWidget {
  // final File ;
  final img_string;
  final description;
  final location;

  // ImageData imageData;

  CardDesign({this.img_string, this.description, this.location});

  @override
  _CardDesignState createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  bool _flag1 = true;
  bool _flag2 = true;
  bool _flag3 = true;

  bool click = true;
  GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(builder: (context, model, child) {
      return Center(
          child: model.userDetails != null ? render(model) : Container());
    });
  }

  render(LoginController model) {
    String UserName = model.userDetails!.displayName ?? "";
    // Uint8List Myimage = base64Decode(widget.img_string);
    // var _image = MemoryImage(Myimage);

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
        body: SafeArea(
          child: RepaintBoundary(
            key: previewContainer,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 2.3,
                decoration: BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    Container(
                      child: Expanded(
                        child: GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                  child: GestureDetector(
                                      child: Row(
                                children: [
                                  // Positioned(
                                  //   child: IconButton(
                                  //     icon: Icon(Icons.home),
                                  //     iconSize: 32,
                                  //     alignment: Alignment.center,
                                  //     onPressed: () {
                                  //       Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (context) => Uploader()),
                                  //       );
                                  //     },
                                  //   ),
                                  // ),
                                  Positioned(
                                    child: IconButton(
                                        icon: Icon(
                                          (click == false)
                                              ? Icons.thumb_up_sharp
                                              : Icons.thumb_down,
                                        ),
                                        iconSize: 30,
                                        alignment: Alignment.center,
                                        color: Colors.black,
                                        onPressed: () => {
                                              setState(() {
                                                click = !click;
                                              })
                                            }),
                                  ),
                                  Positioned(
                                    child: IconButton(
                                      icon: Icon(Icons.download),
                                      iconSize: 32,
                                      alignment: Alignment.center,
                                      onPressed: _captureSocialPng,
                                    ),
                                  ),
                                ],
                              ))),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.06,
                                    left: 30,
                                    right: 30),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Spacer(),

                                        Text(
                                          UserName,
                                          style: TextStyle(
                                              fontFamily: "ProximaNova-Regular",
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),

                                        Spacer(),
                                        // Icon(
                                        //   FontAwesomeIcons.facebookMessenger,
                                        //   size: 24,
                                        //   color: Colors.black,
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 5,
                                                color: (click == false)
                                                    ? Colors.orange.shade400
                                                    : Colors.purple.shade400,
                                                // color: Colors.orange.shade400,
                                              ),
                                              image: DecorationImage(
                                                //  image: Image.asset('images/cat.png'),
                                                image: Image.memory(
                                                        base64Decode(
                                                            widget.img_string))
                                                    .image,
                                              )),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.92,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                  right: 0,
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(25),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    25)),
                                                    child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                        height: 150,
                                                        decoration:
                                                            BoxDecoration(
                                                                // color: Color(0xFFFFFFF)
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5)),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  22),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                widget
                                                                    .description,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Proxima-Nova-Extrabold",
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                widget.location,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "ProximaNova-Regular",
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => FinalStage()));
                          // },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.13,
                        left: MediaQuery.of(context).size.width * 0.10,
                        child: ElevatedButton(
                          onPressed: () => setState(() => _flag1 = !_flag1),
                          child: Icon(
                            FontAwesomeIcons.solidGem,
                            color: Color(0xff123456),
                            size: 30,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            minimumSize: Size(130, 50),

                            primary: _flag1
                                ? Colors.white
                                : Color(0xff123456), // This is what you need!
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.13,
                        left: MediaQuery.of(context).size.width * 0.35,
                        child: ElevatedButton(
                          onPressed: () => setState(() => _flag2 = !_flag2),
                          child: Icon(
                            FontAwesomeIcons.globe,
                            color: Colors.blue,
                            size: 30,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            minimumSize: Size(130, 50),

                            primary: _flag2
                                ? Colors.white
                                : Colors.blue, // This is what you need!
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.13,
                        right: MediaQuery.of(context).size.width * 0.10,
                        child: ElevatedButton(
                          onPressed: () => setState(() => _flag3 = !_flag3),
                          child: Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                            size: 30,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            minimumSize: Size(130, 50),

                            primary: _flag3 ? Colors.white : Colors.red,

                            // This is what you need!
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }

  Future<void> _captureSocialPng() {
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
