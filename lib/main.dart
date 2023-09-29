import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsFeed(),
    );
  }
}

class NewsFeed extends StatelessWidget {
  final List<String> imageUrls=List.generate(
    10,
        (index) =>
    'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvcHg5MTEwMzUtaW1hZ2Uta3d5bzJvanouanBn.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return buildPortraitLayout();
          } else {
            return buildLandscapeLayout();
          }
        },
      ),
    );
  }

  Widget buildPortraitLayout() {
    return ListView.builder(
      itemCount:imageUrls.length,
      itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child:Container(
              width:150,
              height:150,
              child:Center(
                child:Image.network(imageUrls[index]),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildLandscapeLayout() {
    return GridView.builder(
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount:imageUrls.length,
      itemBuilder:(context, index) {
        return Card(
          child:Container(
            width:150,
            height:150,
            child:Center(
              child:Image.network(imageUrls[index]),
            ),
          ),
        );
      },
    );
  }
}
