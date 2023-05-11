import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  late GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are signed in as:',
            ),
            _currentUser != null
                ? Text(
                    '${_currentUser.displayName} (${_currentUser.email})',
                  )
                : Text('Not signed in'),
            MaterialButton(
              child: Text('Sign in with Google'),
              onPressed: () {
                _googleSignIn.signIn();
              },
            ),
          ],
        ),
      ),
    );
  }
}
