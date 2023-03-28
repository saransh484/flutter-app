import 'package:myapp/not_main2.dart';
import 'package:myapp/page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:myapp/page.dart';
/*
class introSharedPreference{
  static const PREF_KEY = 'preference';
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => new Home()));
    }
  }
}

*/
/*

Navigator.push(context, MaterialPageRoute(builder: (context)=> const Screen Name()));

*/

