import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("PharMa 💊"),
        ),

        // Center a box
        // body: Center(
        //   child: Container(
        //     child: const Text("PharMa 💊"),
        //     margin: const EdgeInsets.all(100),
        //     padding: const EdgeInsets.all(10),
        //   ),

        // ),

        // flexbox
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: const [
        //     Expanded(
        //       flex: 1,
        //       child: Icon(Icons.icecream)
        //       ),
        //     Icon(Icons.keyboard_command_key),
        //     Icon(Icons.ac_unit_sharp)
        //   ],
        // ),

        // Stack
        body: Stack(
          children: [
            Container(
              color: Colors.green,
              width: 100,
              height: 100,
            ),
            Icon(Icons.verified, color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
