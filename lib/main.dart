import 'package:flutter/material.dart';
import 'package:flickr_gallery/bloc/bloc.dart';
import 'package:flickr_gallery/ui/grid_item.dart';

main() => runApp(FlickrGallery());

class FlickrGallery extends StatefulWidget {

  createState() => _FlickrGalleryState();

}

class _FlickrGalleryState extends State<FlickrGallery>{

  var currentPage = 1;
  var checknumber = 99;

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
                return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return GridItem(snapshot.data[index]);
                    },semanticIndexCallback: (_,num){
                      if(num % checknumber == 0 && num != 0){
                        checknumber *= 2;
                        currentPage++;
                        if(currentPage == 11) currentPage = 1;
                        bloc.fetchAllImages(currentPage);
                      }
                    },
                        childCount: snapshot.data.length
                    )
                );
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

