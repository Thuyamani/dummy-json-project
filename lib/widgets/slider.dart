import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './imagescreen.dart';


class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {

  int _current = 0;

  List imgList = [
    'assets/images/slider1.jpg',
    'assets/images/slider2.jpg',
    'assets/images/slider3.jpg',
    'assets/images/slider4.jpg',
    'assets/images/slider5.jpg',
    'assets/images/slider6.jpg',
  ];


 
   Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
           options:  CarouselOptions(
      height: 300,
      
      aspectRatio: 16/9,
      viewportFraction: 1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: false,
      onPageChanged: (index, reason){
        setState(() {
          _current = index;
        });
      },
      scrollDirection: Axis.horizontal,
   ),
    items: imgList.map((img){

      int index = imgList.indexOf(img);
      return Builder(builder: (BuildContext context){
        return Container(
          width: displayWidth(context) * 1,
            child: GestureDetector(
              child: Image.asset(img, fit: BoxFit.cover,),
            onTap: (){
              
              Navigator.push<Widget>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(img, index),
                            ),
                          );
            },
            ),
        );
      },);
    }).toList(),        
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}


