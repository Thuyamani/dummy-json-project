import 'package:dummy/widgets/home.dart';

import './models/navbar.dart';

import 'package:splashscreen/splashscreen.dart';
import 'package:dummy/Widgets/menu.dart';
import 'package:flutter/material.dart';

import 'package:connectivity/connectivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color c = Colors.blue;

  void choiceAction(String choice) {
    setState(() {
      if (choice == ColorMenu.green) {
        c = Colors.green;
        print(ColorMenu.green);
      } else if (choice == ColorMenu.red) {
        c = Colors.red;
         print(ColorMenu.red);
      }
       else {
        c = Colors.blue;
         print(ColorMenu.blue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeColor(colr: c),
      home: SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new MyHomePage(changeColor: choiceAction),
      imageBackground: AssetImage('assets/images/load.jpg'),
      
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
     
      loaderColor: Colors.white,
    ),
      
      //MyHomePage(changeColor: choiceAction),
    );
  }
}



class MyHomePage extends StatefulWidget {

final Function(String val) changeColor;

  const MyHomePage({Key key, this.changeColor}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  void initState() {
    super.initState();
   
  }

 Future<bool> check() async{
  
  var result = await Connectivity().checkConnectivity();
  if(result == ConnectivityResult.none){
     print(result);
        return true;
    
  }
  else if(result == ConnectivityResult.mobile){
         print(result);
        return false;

      }
  else if(result == ConnectivityResult.wifi){
         print(result);
       
            return false;
         
       
    
  }
    print(result);
  return false;
}


//Navbarr nav = Navbarr();
  @override
  Widget build(BuildContext context) {
    // Nav navv = Nav();

    return  FutureBuilder<bool>(
      future: check(),
      builder: (context, AsyncSnapshot<bool> snapshot){
      return snapshot.data?SafeArea(child: Scaffold(
              appBar: AppBar(title: Text('Akatsuki'), centerTitle: true,),
              body: SingleChildScrollView(
                              child: Container(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/internet.png', height: 200,),
            SizedBox(height: 50,),
            Text('OOPS!',style: TextStyle(fontSize:30, fontWeight: FontWeight.bold),),
            Text('NO INTERNET',style: TextStyle(fontSize:30, fontWeight: FontWeight.bold),),
            Text('Please check your network connection.',
            style: TextStyle(fontSize:16, fontWeight: FontWeight.bold, color: Colors.black54),),
            RaisedButton(onPressed: (){
                setState(() {
                  
                });
                }, child: Text('Try Again'), ),
          ],
        ),
                ),
              ),
      )): 
    
    
    Scaffold(
      
        appBar: navBar(
      search: search,
      onPressed: change,
      choiceAction: widget.changeColor,
      context: context,
      ),
      
        drawer: Menu(),
        
        body: SingleChildScrollView(
                  child: Column(
            
    children: <Widget>[
     Home(),
     
    ],
          ),
        ),
      );
  });
}
}