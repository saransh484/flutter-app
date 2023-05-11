import 'package:PharMa/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:PharMa/Search/search_page.dart';
import 'package:PharMa/history/history.dart';
import 'package:PharMa/revenue/revenue.dart';
import 'package:PharMa/sell/sell_page.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  // User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Text("SARANSH BHATNAGAR",
                  //"${user!.displayName}",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("saranshbai20@svvv.edu.in"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/image.png'),
                  radius: 5,
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Revenue'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RevenuePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.trolley),
              title: const Text('Buy'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.sell),
              title: const Text('Sell'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HivePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HistoryPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context, MaterialPageRoute(builder: (context)=> const LogScreen()));
              },
            ),
          ],
        ),
      );
  }
}