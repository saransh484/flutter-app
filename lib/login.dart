import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/home.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _otplessFlutterPlugin = Otpless();

  // ** Function to initiate the login process
  void initiateWhatsappLogin(String intentUrl) async{
    var result = await _otplessFlutterPlugin.loginUsingWhatsapp(intentUrl: intentUrl);
    switch (result['code']) {
      case "581":
        print(result['message']);
        //TODO: handle whatsapp not found
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // ** Function that is called when page is loaded
  // ** We can check the auth state in this function
  Future<void> initPlatformState() async {
    _otplessFlutterPlugin.authStream.listen((token) {
      // TODO: Handle user token like storing in SharedPreferences or navigation
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                icon: const Icon(Icons.chat),
                label: Text("Login"), onPressed: () {
                  initiateWhatsappLogin("https://svvv.authlink.me?redirectUri=svvvotpless://otpless");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/*
//Add this to your screen widget view code 
CupertinoButton.filled(
child: Text("ContinueWithWhatsApp"),
onPressed: () {
initiateWhatsappLogin("https://svvv.authlink.me?redirectUri=svvvotpless://otpless");
})
*/