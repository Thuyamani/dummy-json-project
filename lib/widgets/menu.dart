import 'package:dummy/widgets/about.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Itachi'), 
              accountEmail: Text('Itachi@uchiha.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/itachi3.gif'),
              ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('About Akatsuki'),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));
                },
              ),
          ],
        ),
      );
  }
}