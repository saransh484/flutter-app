import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getting Started'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('BUY'),
          padding: EdgeInsets.all(50),
          shape: CircleBorder(),
          ),
          MaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
          },
          color: Colors.red,
          textColor: Colors.white,
          child: Text('SELL'),
          padding: EdgeInsets.all(50),
          shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}