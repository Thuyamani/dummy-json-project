import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:shimmer/shimmer.dart';
import 'card.dart';
import 'dart:async';


class CardDetails extends StatefulWidget {

final Users user;

  CardDetails(this.user);

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  bool search = false;

   change() {
    setState(() {
      if (search == true) {
        search = false;
      } else {
        search = true;
      }
    });
  }

  Icon navSearch = Icon(Icons.search);

    Future<void> share() async {
      await FlutterShare.share(
        title: widget.user.title,
        text: widget.user.para,
        linkUrl: widget.user.image,
        chooserTitle: 'Example Chooser Title');
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
          title:search ? Container(
       
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
          ),
          child: TextField(style: TextStyle(
            backgroundColor: Colors.white,
           color: Colors.black
          ),
           decoration: InputDecoration(
           //  fillColor: Colors.black,
           contentPadding: EdgeInsets.only(left:15),
              border: InputBorder.none,
              hintText: 'Search',
             
            )
          ),
        ) :
        // mainTitle,

          InkWell(onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
             Navigator.pop(context);
          },
            child: Image(image: AssetImage('assets/images/itachi3.gif',),width: 80.0,height: 50.0,)),
            elevation: 20,
             actions: <Widget>[
          IconButton(icon: navSearch, onPressed: change,),
         
           
        ],
        ),
       // backgroundColor: Colors.green,
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Image.network(widget.user.image),
            SizedBox(
              height: 30,
            ),
            
            Shimmer.fromColors(
                baseColor: Colors.black,
                 highlightColor: Colors.blue,
               
                 period: Duration(seconds:2),
            child:Center(
               child: Text(widget.user.title, textAlign: TextAlign.center, style: TextStyle(fontSize:50, fontWeight: FontWeight.bold),)
            ),
            ),
            SizedBox(
              width: 150,
              child: Divider(thickness: 1,color: Colors.black,),
            ),
            IconButton(icon: Icon(Icons.share), onPressed: () {
                  
                  share();
                }
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(widget.user.para, style: TextStyle(fontSize:25),),
            ),
          ],
        ),
      )
    );
  }
}