import 'package:dummy/widgets/carddetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {

 Future<List<Users>> _getUsers() async{
    var data = await http.get('http://www.json-generator.com/api/json/get/bUybPKSYeq?indent=2');
    var jsonData = json.decode(data.body);

    List<Users> userDatas = [];

    for(var u in jsonData){
      Users slider = Users(u['para'],u['image'], u['title'], u['index']);
      userDatas.add(slider);
    }
    print(userDatas);
    return  userDatas;
    
  }

  

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
    return FutureBuilder<List<Users>>(
           future: _getUsers(),
           builder: (BuildContext context, AsyncSnapshot<List<Users>> snapshot){
             if(snapshot.data == null && snapshot.connectionState == ConnectionState.waiting){
               return Container(
                 child: Center(
                   child: CircularProgressIndicator(),
                 ),
               );
             }
             else{
         
              return Column(
                children: 
                snapshot.data.map((user){
                return GestureDetector(
                       onTap: (){
                         
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> CardDetails(user)));
                         },
                                                 child: Card(
                         elevation: 5,
                         child: Row(
                           children: <Widget>[
                             Container(
                               width: displayWidth(context) * 0.45,
                               child: Image.network(user.image,  ),
                               ),
                             SizedBox(width: displayWidth(context) * 0.05,),
                             Container(
                               width: displayWidth(context) * 0.45,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: <Widget>[
                                    Container(
                                    width:  displayWidth(context) * 1,
                                      child: Text(user.title, style: TextStyle(fontSize:displayWidth(context) * 0.05, fontWeight: FontWeight.bold)),
                                      ),
                                    SizedBox(height: 10,width:50,child: Divider(thickness: 1, color: Colors.black,),),
                                    Container(
                                      
                                      height: 100,
                                      width:  displayWidth(context) * 1,
                                      padding: EdgeInsets.only(right: 13.0),
                                      child: Text(
                                        user.para,
                                      overflow: TextOverflow.ellipsis, 
                                      maxLines: 4,
                                      style: TextStyle(fontSize:displayWidth(context) * 0.04),
                                      ),
                                    ),
                                 ],
                               ),
                             ),
                             
                           ],
                         ),
                       ),
                     );
              }).toList()
              
              );
             }
           },
           );
  }
}

class Users {
  final String para;
  final String image;
  final String title;
  final int index;


  Users(this.para, this.image, this.title, this.index);

}

// Expanded(
//                                                       child: Row(
//                               children: <Widget>[
//                                 Image.network(snapshot.data[index].image, width:200),
//                                 Text(snapshot.data[index].title, style: TextStyle(fontSize:30),),
//                               ],
//                             ),
//                           );

// ListView.builder(
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (BuildContext context, int index){
//                         return GestureDetector(
//                           onTap: (){
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));
//                             },
//                                                     child: Card(
//                             elevation: 5,
//                             child: Row(
//                               children: <Widget>[
//                                 Image.network(snapshot.data[index].image, width: 200, ),
//                                 SizedBox(width: 20,),
//                                 Text(snapshot.data[index].title, style: TextStyle(fontSize:20)),
//                               ],
//                             ),
//                           ),
//                         );

//                     },
//                     )