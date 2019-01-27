import 'package:flutter/material.dart';
import 'grid_item.dart';

class CustomStreamBuilder{

  var currentPage = 1;
  var checkNumber = 99;
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
                  crossAxisCount: 3,
                  childAspectRatio: 1
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return GridItem(snapshot.data[index]);
              },
                  semanticIndexCallback: (_,num){
                  if(num / checkNumber == 1.0){
                    checkNumber += 99;
                    currentPage++;
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

