import 'package:flutter/material.dart';
import 'grid_item.dart';
import 'package:flickr_gallery/bloc/bloc.dart';

class CustomStreamBuilder{

  var currentPage = 1;
  var checknumber = 99;
  final bloc;

  CustomStreamBuilder(this.bloc);

  getBuilder(){
    bloc.fetchAllImages(currentPage);
    return StreamBuilder(
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
    );
  }
}

