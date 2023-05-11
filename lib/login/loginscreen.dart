import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/pharMa.png",
                height: 240,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  labelText: "Username",
                  hintText: "Enter Your Email",
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passController,
                obscureText: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  labelText: "Password",
                  hintText: "Enter Your Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  side: const BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'LOGIN',
                  ),
                ),
                onPressed: () => signIn(),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    thickness: 0.7,
                    color: Colors.blueGrey,
                  )),
                  const Text('Or Login Using'),
                  const Expanded(
                      child: Divider(
                    thickness: 0.7,
                    color: Colors.blueGrey,
                  )),
                ],
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => Auth().signInWithGoogle(),
                child: Container(
                  height: 40,
                  width: 200,
                  child: MaterialButton(
                    onPressed: () => Auth().signInWithGoogle(),
                    elevation: 10,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/google.png'),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Login Using Google',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
