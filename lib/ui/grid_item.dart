import 'package:flutter/material.dart';
import 'full_screen.dart';

class GridItem extends StatefulWidget {
  final url;

  GridItem(this.url);

  createState() => _GridItemState();

}

class _GridItemState extends State<GridItem> with TickerProviderStateMixin{

  Animation colorAnimation;
  AnimationController colorAnimationController;

  initState(){
    colorAnimationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    colorAnimation = Tween(begin: 1.0, end: 0.0).animate(colorAnimationController);
    super.initState();
  }

  dispose(){
    colorAnimationController.dispose();
    super.dispose();
  }

  build(context) {
    var image;
    image = Image.network(widget.url).image ?? AssetImage("assets/error.png");
//    image.resolve(ImageConfiguration()).addListener((imageInfo, synchronousCall){
//      colorAnimationController.forward();
//    });
    
    return AnimatedBuilder(
        animation: colorAnimation,
        builder: (context,_){
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black54,
                  image: DecorationImage(
                    image: image,
                    colorFilter: ColorFilter.mode(
                        Colors.black54,
                        BlendMode.hardLight
                    ),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FullScreen(widget.url)),
              );
            },
          );
        });
  }

}