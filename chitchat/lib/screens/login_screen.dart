import 'package:firebase_auth/firebase_auth.dart';
import 'package:chitchat/components/rounded_button.dart';
import 'package:chitchat/screens/chat_screen.dart';
import 'package:chitchat/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // 1

                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  // 2

                  SizedBox(
                    height: 48.0,
                  ),

                  // 3

                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // 4

                  SizedBox(
                    height: 8.0,
                  ),
                  // 5

                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // 6

                  SizedBox(
                    height: 24.0,
                  ),
                  // 7

                  RoundedButton(
                    onPressed: () async {
                      final progress = ProgressHUD.of(context);
                      progress?.show();
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        progress?.dismiss();
                        if (user != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    title: 'Log In',
                    color: Colors.orangeAccent,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
