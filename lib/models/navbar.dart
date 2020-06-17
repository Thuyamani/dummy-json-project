import 'package:flutter/material.dart';


ThemeData themeColor({Color colr}){
  return ThemeData(
        primarySwatch: colr,
        visualDensity: VisualDensity.adaptivePlatformDensity,
       // textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        
      );
}


class NavBarr extends StatefulWidget {
  @override
  _NavBarrState createState() => _NavBarrState();
}

class _NavBarrState extends State<NavBarr> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}





AppBar navBar({bool search, VoidCallback onPressed, Function(String vall) choiceAction, BuildContext context}){


Icon navSearch = Icon(Icons.search);

  return AppBar(
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
              Navigator.canPop(context);
          },
            child: Image(image: AssetImage('assets/images/itachi3.gif',),width: 80.0,height: 50.0,)),
        
        elevation: 20,
        actions: <Widget>[
          IconButton(icon: navSearch, onPressed: onPressed,),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context){
              return ColorMenu.choices.map((choice){
                return PopupMenuItem(child: Text(choice),value: choice,);
              }).toList();
            },
            onSelected: choiceAction,
            ),
        ],
      );
}



class ColorMenu{
static const String green ="Green";
static const String blue = 'Blue';
static const String red = 'Red';


static const List<String> choices= <String>[
green, blue, red
];

}