import 'package:flutter/material.dart';
import 'package:flickr_gallery/ui/images_grid.dart';
import 'package:flickr_gallery/bloc/bloc.dart';

main() => runApp(FlickrGallery());

class FlickrGallery extends StatefulWidget {

  createState() => _FlickrGalleryState();

}

class _FlickrGalleryState extends State<FlickrGallery>{

  var currentPage = 1;

  build(context){
    bloc.fetchAllImages(currentPage);
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            title: Text("Flickr Gallery"),
          ),
          StreamBuilder(
            stream: bloc.images,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return buildGrid(snapshot.data,
                (){
                  currentPage++;
                  if(currentPage == 11) currentPage = 1;
                  bloc.fetchAllImages(currentPage);
                });
              }else{
                return SliverToBoxAdapter(
                  child: Center(
                    child: RefreshProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

