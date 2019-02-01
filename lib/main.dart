import 'package:flutter/material.dart';
import 'package:flickr_gallery/bloc/bloc.dart';
import 'package:flickr_gallery/ui/grid_item.dart';
import 'package:flickr_gallery/ui/stream_builder.dart';

main() => runApp(FlickrGallery());

class FlickrGallery extends StatefulWidget {

  createState() => _FlickrGalleryState();

}

class _FlickrGalleryState extends State<FlickrGallery>{

  build(context){
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            title: Text("Flickr Gallery"),
          ),
          CustomStreamBuilder(bloc)
        ],
      ),
    );
  }
}
