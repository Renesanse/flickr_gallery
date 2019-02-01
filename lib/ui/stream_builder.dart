import 'package:flutter/material.dart';
import 'grid_item.dart';

class CustomStreamBuilder extends StatelessWidget{

  var currentPage = 1;
  var checkNumber = 99;
  final bloc;

  CustomStreamBuilder(this.bloc);

  build(context) {
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

