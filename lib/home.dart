import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s2_calculator/beginner.dart';
import 'package:s2_calculator/contactus.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  accountName: Text(
                    "Calculator",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  currentAccountPicture: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/logo.png"),
                      backgroundColor: Colors.blue),
                ),
                _createDrawerItem(
                    icon: Icons.person,
                    text: 'Contact Us',
                    c: Colors.amber,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contactus()),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    color: Colors.blue,
                    thickness: 1.0,
                    indent: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Beginner()),
                  );
                },
                child: Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0,top: 5,bottom: 5),
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Center(child: Text('Beginner'))),
              ),

              InkWell(
                onTap: (){

                },
                child: Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0,top: 5,bottom: 5),
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Center(child: Text('Expert'))),
              ),
            ],
          )
        ), //<- place where the image appears
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap, Color c}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: c,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
