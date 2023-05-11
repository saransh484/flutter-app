import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:PharMa/login/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.openBox('Medbox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: MainPage(),
    );
  }
}
