import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:full_screen_image/full_screen_image.dart';
import 'package:pinch_zoom/pinch_zoom.dart';



class ImageFromNetwork extends StatefulWidget {

  @override
  _ImageFromNetworkState createState() => _ImageFromNetworkState();
}

class _ImageFromNetworkState extends State<ImageFromNetwork> {
  String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical:30,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),

        ),
        child: Container(
          child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 04,
              crossAxisSpacing: 01,
              mainAxisSpacing: 01),
              itemBuilder: (BuildContext context, int index)=> Container(
                child: FullScreenWidget(
                  child: PinchZoom(
                    resetDuration: const Duration(milliseconds: 100),
                    onZoomStart: (){print('start zooming');},
                    onZoomEnd: (){print('stop zooming');},
                    zoomEnabled: true,
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/200/300?random?=$index',
                      fit:BoxFit.contain,
                      placeholder: _loader,
                      errorWidget: _error,),
                  ),
                ),
              ),

          ),
        ),
      ),
    );
  }
  Widget _loader(BuildContext context,String url){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error(BuildContext context,String url,dynamic error)
  {
    print(error);
    return Center(
      child:Icon(Icons.error_outline),
    );
  }
}
