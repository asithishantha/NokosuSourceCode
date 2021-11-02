import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:kjapp/testpage.dart';
import 'package:photo_manager/photo_manager.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MediaGrid(),
    );
  }
}

class MediaGrid extends StatefulWidget {
  @override
  _MediaGridState createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  List<Widget> _mediaList = [];
  int currentPage = 0;
  late int lastPage;
  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success
//load the album list
      List<AssetPathEntity> albums =
          // await PhotoManager.getAssetPathList(onlyAll: true);
          await PhotoManager.getAssetPathList(onlyAll: true);

      print(albums);
      List<AssetEntity> media =
          await albums[0].getAssetListPaged(currentPage, 30); //preloading files
      print(media);

      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future:
                asset.thumbDataWithSize(1000, 1000), //resolution of thumbnail
            builder:
                (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  child: GestureDetector(
                    onTap: () => postIM(snapshot),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Positioned.fill(
                            child: Image.memory(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (asset.type == AssetType.video)
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5, bottom: 5),
                              child: Icon(
                                Icons.videocam,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        );
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        _handleScrollEvent(scroll);
        return false;
      },
      child: GridView.builder(
          itemCount: _mediaList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return _mediaList[index];
          }),
    );
  }

  void postIM(snapshot) {
    // String base64String = base64Encode(snapshot.data!!.readAsBytesSync());

    // final String img_string = base64String;
    // final String description = descriptionController.text;
    // final String location = locationController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TestPage(
                snapshot: snapshot,
                // description: description,
                // location: location,
              )),
    );
  }

  // String base64Encode(readAsBytesSync) {}

}
