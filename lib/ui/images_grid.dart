import 'package:flutter/material.dart';
import 'grid_item.dart';

buildGrid(values, action){
  return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return GridItem(values[index]);
      },
          semanticIndexCallback: (_,num){
            num == 99 ? action() : null;
          },
        childCount: values.length
      )
  );

}
