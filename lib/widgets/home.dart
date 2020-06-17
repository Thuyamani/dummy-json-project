import 'package:dummy/widgets/card.dart';
import 'package:flutter/material.dart';
import '../widgets/slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
    //  crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Sliders(),
         Cards(),
      ],
    );
  }
}