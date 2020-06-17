
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class About extends StatefulWidget {

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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

  String about = '''The Akatsuki was a secret criminal organization that gathers most of the major antagonists and later the main antagonists of the Naruto series. The Akatsuki contains over 10 official members, a handful of unofficial members, and all except for one are males. It was founded by Yahiko, and Konan with Nagato as the leader though he acts under the alias known as Pain.''' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
          title:search ? TextField(style: TextStyle(
          backgroundColor: Colors.white,
         
        ),
         decoration: InputDecoration(
           fillColor: Colors.black,
            
            hintText: 'Search',
            hintStyle: TextStyle(
              backgroundColor: Colors.white,
              color: Colors.black,
            )
          )
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
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Image.asset('assets/images/about2.jpg'),
              ),
             Padding(
               padding: const EdgeInsets.all(18.0),
               child: Text(about, style: TextStyle(fontSize:20),),
             ),
             Shimmer.fromColors(
               baseColor: Colors.black,
               highlightColor: Colors.red,
               child: Image.asset('assets/images/Akatsuki.png'),
               period: Duration(seconds:3),
             ),
            ],
          ),
        ),
        );
  }
}