import 'package:flutter/material.dart';
import 'package:myapp/Search/productview.dart';
import 'package:myapp/Search/search_page.dart';
import 'package:myapp/history/history.dart';
import 'package:myapp/homepage/drawer.dart';
import 'package:myapp/sell/sell_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {super.key,
      required this.title,
      required this.name,
      required this.email});

  final String title;
  final String name;
  final String email;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF448AFF),
              Color(0xFF26CBE6),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.0), // here the desired height
                child: AppBar(
                  actions: <Widget>[
                  InkWell(
                    child: Icon(Icons.history),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoryPage()));
                    },
                  )
                ]
                )),
            backgroundColor: Colors.transparent,
            body: Container(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: _height / 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/image.png'),
                            radius: _height / 10,
                          ),
                          SizedBox(
                            height: _height / 30,
                          ),
                          Text(
                            'Hello ${user!.displayName}!', // name
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _height / 2.2),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _height / 2.6,
                        left: _width / 20,
                        right: _width / 20),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: _height / 10),
                          child: Column(
                            children: <Widget>[
                              infoChild(_width, Icons.email, user!.email),
                              infoChild(_width, Icons.call, user!.phoneNumber),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchPage()));
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: _height / 30),
                                      child: Container(
                                        width: _width / 3,
                                        height: _height / 20,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF26CBE6),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(_height / 40)),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black87,
                                                  blurRadius: 2.0,
                                                  offset: Offset(0.0, 1.0))
                                            ]),
                                        child: const Center(
                                          child: Text('Buy',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HivePage()));
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: _height / 30),
                                      child: Container(
                                        width: _width / 3,
                                        height: _height / 20,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF26CBE6),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(_height / 40)),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black87,
                                                  blurRadius: 2.0,
                                                  offset: Offset(0.0, 1.0))
                                            ]),
                                        child: const Center(
                                          child: Text('Sell',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            drawer: DrawerScreen(),
          ),
        ],
      ),
    );
  }

  Widget headerChild(String header, int value) => Expanded(
          child: Column(
        children: <Widget>[
          Text(header),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '$value',
            style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF26CBE6),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 10,
              ),
              Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
