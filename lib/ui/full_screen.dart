import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreen extends StatelessWidget {

  final String url;
  FullScreen(this.url);

  build(context) {
    return Container(
        child: Stack(
          children: <Widget>[
            PhotoView(
              imageProvider: Image.network(url).image,
            ),
          ],
        )
    );
  }
}
