import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ImageScreen extends StatefulWidget {
  final String url;
  final int i;
  ImageScreen(this.url, this.i);

  @override
  _MyImageScreen createState() => _MyImageScreen();
}

class _MyImageScreen extends State<ImageScreen> {
   
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

  
 Future<List<SliderText>> _getText() async{
    var data = await http.get('http://www.json-generator.com/api/json/get/bQrgQvmPoy?indent=2');
    var jsonData = json.decode(data.body);

    List<SliderText> sliderDatas = [];

    for(var u in jsonData){
      SliderText slider = SliderText(u['p']);
      sliderDatas.add(slider);
    }
    return  sliderDatas;
  }

 

  @override
  Widget build(BuildContext context) {
     int index = widget.i;
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
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Image.asset(widget.url, width: double.infinity),
              SizedBox(height: 30,),
              Shimmer.fromColors(
                baseColor: Colors.black,
                 highlightColor: Colors.blue,
                 period: Duration(seconds:2),
                child: Text('Slider ${index + 1}', style: TextStyle( fontSize: 50,fontWeight: FontWeight.bold),
                ),
                ),
               SizedBox(
                 width: 150.0,
                 child: Divider(
                   color: Colors.black,
                   thickness: 2.0,
                 ),
               ),
              FutureBuilder(
                future: _getText(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  else{
                   
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(snapshot.data[index].p, style: TextStyle(fontSize: 25),),
                    );
                  }
                },
                ),
                
            ],
            
          ),
        ),
        
        );
  }
}

class SliderText {
  final String p;

  SliderText(this.p);

}